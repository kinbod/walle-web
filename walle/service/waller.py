#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: wushuiyong
# @Created Time : 日  1/ 1 23:43:12 2017
# @Description:

from fabric2 import Connection
from flask import current_app
from walle.model.deploy import TaskRecordModel




class Waller(Connection):
    connections, success, errors = {}, {}, {}
    release_version_tar, release_version = None, None

    def run(self, command, wenv=None, sudo=False, **kwargs):
        try:
            if sudo:
                result = super(Waller, self).sudo(command, pty=True, **kwargs)
            else:
                result = super(Waller, self).run(command, pty=True, **kwargs)

            message = 'task_id=%s, host:%s command:%s status:%s, success:%s, error:%s' % (
                wenv['task_id'], self.host, command, result.exited, result.stdout.strip(), result.stderr.strip()
            )

            wenv['websocket'].send_updates(message)
            TaskRecordModel().save_record(stage=wenv['stage'], sequence=wenv['sequence'], user_id=wenv['user_id'],
                                          task_id=wenv['task_id'], status=result.exited, host=self.host, user=self.user,
                                          command=result.command,success=result.stdout.strip(), error=result.stderr.strip())
            current_app.logger.info(message)
            return result
        except Exception, e:
            # TODO 貌似可能的异常有很多种，需要分层才能完美解决 something wrong without e.result
            TaskRecordModel().save_record(stage=wenv['stage'], sequence=wenv['sequence'], user_id=wenv['user_id'],
                                          task_id=wenv['task_id'], status=1, host=self.host, user=self.user,
                                          command=command, success='', error='e.result')
            message = 'task_id=%d, host:%s command:%s, status=1, reason:%s, result:%s, args:%s' % (
                wenv['task_id'], self.host, command, e.reason, e.result, e.args
            )
            wenv['websocket'].send_updates(message)
            current_app.logger.error(message)

            return False

    def sudo(self, command, wenv=None, **kwargs):
        return self.run(command, wenv=wenv, sudo=True, **kwargs)

    def get(self, remote, local=None, wenv=None):
        return self.sync(wtype='get', remote=remote, local=local, wenv=wenv)

    def put(self, local, remote=None, wenv=None, *args, **kwargs):
        return self.sync(wtype='put', local=local, remote=remote, wenv=wenv, *args, **kwargs)

    def sync(self, wtype, remote=None, local=None, wenv=None):
        try:
            if wtype == 'put':
                result = super(Waller, self).put(local=local, remote=remote)
                command = 'put: scp %s %s@%s:%s' % (result.local, self.user, self.host, result.remote)
                current_app.logger.info('put: local %s, remote %s', local, remote)

            else:
                result = super(Waller, self).get(remote=remote, local=local)
                command = 'get: scp %s@%s:%s %s' % (self.user, self.host, result.remote, result.local)
                current_app.logger.info('get: local %s, remote %s', local, remote)
                current_app.logger.info('get: orig_local %s, local %s', result.orig_local, result.local)

            current_app.logger.info('put: %s, %s', result, dir(result))
            # TODO 可能会有非22端口的问题
            TaskRecordModel().save_record(stage=wenv['stage'], sequence=wenv['sequence'], user_id=wenv['user_id'],
                                          task_id=wenv['task_id'], status=0, host=self.host, user=self.user,
                                          command=command, )
            message = 'task_id=%d, host:%s command:%s status:0, success:, error:' % (
            wenv['task_id'], self.host, command)
            current_app.logger.info(message)
            wenv['websocket'].send_updates(message)

            return result
        except Exception, e:
            # TODO 收尾下
            current_app.logger.info('put: %s, %s', e, dir(e))
