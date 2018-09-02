#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: wushuiyong
# @Created Time : 日  1/ 1 23:43:12 2017
# @Description:


import time
from datetime import datetime

import os
# from fabric import context_managers, colors
from flask import current_app

from fabric2 import Connection

from walle.model import deploy as TaskModel


# import fabric2.exceptions.GroupException


class Waller:
    '''
    序列号
    '''
    stage = ''

    sequence = 0
    stage_prev_deploy = 'prev_deploy'
    stage_deploy = 'deploy'
    stage_post_deploy = 'post_deploy'

    stage_prev_release = 'prev_release'
    stage_post_release = 'post_release'

    task_id = ''
    taskMdl = None
    TaskRecord = None

    version = datetime.now().strftime('%Y%m%d%H%M%s')
    project_name = 'walden'
    dir_codebase = '/tmp/walle/codebase/'
    dir_codebase_project = dir_codebase + project_name

    # dir_release  = '/home/wushuiyong/walle/release'
    # dir_webroot  = '/home/wushuiyong/walle/webroot'

    # 定义远程机器
    # env.hosts = ['172.16.0.231', '172.16.0.177']
    # env.user = 'wushuiyong'

    dir_release = None
    dir_webroot = None

    connections, success, errors = {}, {}, {}
    release_version_tar, release_version = None, None

    # TODO user需要配置
    local = Connection('127.0.0.1', user='wushuiyong')

    def __init__(self, task_id=None):
        self.TaskRecord = TaskModel.TaskRecordModel()
        current_app.logger.error('ddddddddddddd')
        if task_id:
            self.task_id = task_id
            self.taskMdl = TaskModel.TaskModel().item(self.task_id)
            self.user_id = self.taskMdl.get('user_id')
            self.servers = self.taskMdl.get('servers').split(',')
            self.task = self.taskMdl.get('target_user')
            self.project_info = self.taskMdl.get('project_info')

    # ===================== fabric ================
    # SocketHandler
    def prev_deploy(self):
        '''
        1.代码检出前要做的基础工作
        - 检查 当前用户
        - 检查 python 版本
        - 检查 git 版本
        - 检查 目录是否存在
        - 用户自定义命令

        :return:
        '''
        self.stage = self.stage_prev_deploy
        self.sequence = 1

        # 检查 当前用户
        command = 'whoami'
        result = self.local.run(command)
        current_app.logger.error('###########')

        ret = self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                          task_id=self.task_id, status=1, command=command,
                                          success=result.stdout, error=result.stderr)
        current_app.logger.info('save_record %s', ret)
        current_app.logger.info('command: %s  success: %s, error: %s', command, result.stdout, result.stderr)

        # 检查 python 版本
        command = 'python --version'
        result = self.local.run(command)

        self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                    task_id=self.task_id, status=1, command=command,
                                    success=result.stdout, error=result.stderr)
        current_app.logger.info('command: %s  success: %s, error: %s', command, result.stdout, result.stderr)

        # 检查 git 版本
        command = 'git --version'
        result = self.local.run(command)

        self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                    task_id=self.task_id, status=1, command=command,
                                    success=result.stdout, error=result.stderr)
        current_app.logger.info('command: %s  success: %s, error: %s', command, result.stdout, result.stderr)

        # 检查 目录是否存在
        command = 'mkdir -p %s' % (self.dir_codebase_project)
        current_app.logger.info(command)
        result = self.local.run(command)

        # TODO: 外层需要加异常捕获,日志记录
        self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                    task_id=self.task_id, status=1, command=command,
                                    success=result.stdout, error=result.stderr)
        current_app.logger.info('command: %s  success: %s, error: %s', command, result.stdout, result.stderr)

        # 用户自定义命令
        command = self.project_info['prev_deploy']
        current_app.logger.info(command)
        with self.local.cd(self.dir_codebase_project):
            result = self.local.run(command)

        # TODO: 外层需要加异常捕获,日志记录
        self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                    task_id=self.task_id, status=1, command=command,
                                    success=result.stdout, error=result.stderr)
        current_app.logger.info('command: %s  success: %s, error: %s', command, result.stdout, result.stderr)

        # SocketHandler.send_to_all({
        #     'type': 'user',
        #     'id': 33,
        #     'host': env.host_string,
        #     'command': command,
        #     'message': result.stdout,
        # })

    def deploy(self):
        '''
        2.检出代码

        :param project_name:
        :return:
        '''
        self.stage = self.stage_deploy
        self.sequence = 2

        current_app.logger.info('git dir: %s', self.dir_codebase_project + '/.git')
        # 如果项目底下有 .git 目录则认为项目完整,可以直接检出代码
        # TODO 不标准
        if os.path.exists(self.dir_codebase_project + '/.git'):
            with self.local.cd(self.dir_codebase_project):
                command = 'pwd && git pull'
                result = self.local.run(command)
                self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                            task_id=self.task_id, status=1, command=command,
                                            success=result.stdout, error=result.stderr)
                current_app.logger.info('command: %s  success: %s, error: %s', command, result.stdout, result.stderr)


        else:
            # 否则当作新项目检出完整代码
            with self.local.cd(self.dir_codebase_project):
                command = 'pwd && git clone %s .' % (self.project_info['repo_url'])
                current_app.logger.info('cd %s  command: %s  ', self.dir_codebase_project, command)

                result = self.local.run(command)
                # TODO command should be result.command
                self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                            task_id=self.task_id, status=1, command=result.command,
                                            success=result.stdout, error=result.stderr)
                current_app.logger.info('command: %s  success: %s, error: %s', command, result.stdout, result.stderr)

        # copy to a local version
        self.release_version = '%s_%s_%s' % (
        self.project_name, self.task_id, time.strftime('%Y%m%d_%H%M%S', time.localtime(time.time())))
        with self.local.cd(self.dir_codebase):
            command = 'cp -rf %s %s' % (self.dir_codebase_project, self.release_version)
            current_app.logger.info('cd %s  command: %s  ', self.dir_codebase_project, command)

            result = self.local.run(command)
            # TODO command should be result.command
            self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                        task_id=self.task_id, status=1, command=result.command,
                                        success=result.stdout, error=result.stderr)
            current_app.logger.info('command: %s  success: %s, error: %s', command, result.stdout, result.stderr)

        # 更新到指定 commit_id
        with self.local.cd(self.dir_codebase + self.release_version):
            command = 'git reset -q --hard %s' % (self.taskMdl.get('commit_id'))
            result = self.local.run(command)
            self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                        task_id=self.task_id, status=1, command=command,
                                        success=result.stdout, error=result.stderr)
            current_app.logger.info('command: %s  success: %s, error: %s', command, result.stdout, result.stderr)
            # SocketHandler.send_to_all({
            #     'type': 'user',
            #     'id': 33,
            #     'host': env.host_string,
            #     'command': command,
            #     'message': result.stdout,
            # })

            # 用户自定义命令
            # command = self.project_info['deploy']
            # current_app.logger.info(command)
            # with self.local.cd(self.dir_codebase):
            #     result = self.local.run(command)
            #
            # # TODO: 外层需要加异常捕获,日志记录
            # self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
            #                             task_id=self.task_id, status=1, command=command,
            #                             success=result.stdout, error=result.stderr)
            # current_app.logger.info('command: %s  success: %s, error: %s', command, result.stdout, result.stderr)

        pass

    def post_deploy(self):

        '''
        3.检出代码后要做的任务
        - 用户自定义操作命令
        - 代码编译
        - 清除日志文件及无用文件
        -
        - 压缩打包
        - 传送到版本库 release
        :return:
        '''

        # 用户自定义命令
        command = self.project_info['post_deploy']
        current_app.logger.info(command)
        with self.local.cd(self.dir_codebase + self.release_version):
            result = self.local.run(command)

        # TODO: 外层需要加异常捕获,日志记录
        self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                    task_id=self.task_id, status=1, command=command,
                                    success=result.stdout, error=result.stderr)
        current_app.logger.info('command: %s  success: %s, error: %s', command, result.stdout, result.stderr)

        # 压缩打包
        self.release_version_tar = '%s.tgz' % (self.release_version)
        with self.local.cd(self.dir_codebase):
            command = 'tar zcvf %s %s' % (self.release_version_tar, self.release_version)
            result = self.local.run(command)

            # TODO: 外层需要加异常捕获,日志记录
            self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                        task_id=self.task_id, status=1, command=result.command,
                                        success=result.stdout, error=result.stderr)
            current_app.logger.info('command: %s  success: %s, error: %s', command, result.stdout, result.stderr)
            # TaskModel.TaskModel().update({'id':self.task_id, })

    def prev_release(self, connection):
        '''
        4.部署代码到目标机器前做的任务
        - 检查 webroot 父目录是否存在
        :return:
        '''

        # 检查 target_library 父目录是否存在
        command = 'mkdir -p %s' % (self.project_info['target_library'])
        result = connection.run(command)

        # TODO: 外层需要加异常捕获,日志记录
        self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                    task_id=self.task_id, status=1, command=result.command,
                                    success=result.stdout, error=result.stderr)
        current_app.logger.info('command: %s  success: %s, error: %s', result.command, result.stdout, result.stderr)

        # TODO 检查 webroot 父目录是否存在,是否为软链
        # command = 'mkdir -p %s' % (self.project_info['target_root'])
        # result = connection.run(command)
        # current_app.logger.info('command: %s', dir(result))
        #
        # # TODO: 外层需要加异常捕获,日志记录
        # self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
        #                             task_id=self.task_id, status=1, command=result.command,
        #                             success=result.stdout, error=result.stderr)
        # current_app.logger.info('command: %s  success: %s, error: %s', result.command, result.stdout, result.stderr)


        # TODO md5
        # 传送到版本库 release
        current_app.logger.info('/tmp/walle/codebase/' + self.release_version_tar)
        result = connection.put('/tmp/walle/codebase/' + self.release_version_tar,
                                remote=self.project_info['target_library'])
        current_app.logger.info('command: %s', dir(result))

        # TODO: 外层需要加异常捕获,日志记录
        # TODO put 没有command,result.stderr
        self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                    task_id=self.task_id, status=1, command='',
                                    success='', error='')
        current_app.logger.info('command: sync %s to %s', result.local, result.remote)

        # 解压
        self.release_untar(connection)

    def release(self, connection):
        '''
        5.部署代码到目标机器做的任务
        - 打包代码 local
        - scp local => remote
        - 解压 remote
        :return:
        '''
        with connection.cd(self.project_info['target_library']):
            # 1. create a tmp link dir
            current_link_tmp_dir = '%s/current-tmp-%s' % (self.project_info['target_library'], self.task_id)
            command = 'ln -sfn %s/%s %s' % (
            self.project_info['target_library'], self.release_version, current_link_tmp_dir)
            result = connection.run(command)
            # TODO: 外层需要加异常捕获,日志记录
            self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                        task_id=self.task_id, status=1, command=result.command,
                                        success=result.stdout, error=result.stderr)
            current_app.logger.info('command: %s  success: %s, error: %s', result.command, result.stdout, result.stderr)

            # 2. make a soft link from release to tmp link

            # 3. move tmp link to webroot
            current_link_tmp_dir = '%s/current-tmp-%s' % (self.project_info['target_library'], self.task_id)
            command = 'mv -fT %s %s' % (current_link_tmp_dir, self.project_info['target_root'])
            result = connection.run(command)
            # TODO: 外层需要加异常捕获,日志记录
            self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                        task_id=self.task_id, status=1, command=result.command,
                                        success=result.stdout, error=result.stderr)
            current_app.logger.info('command: %s  success: %s, error: %s', result.command, result.stdout, result.stderr)

    def release_untar(self, connection):
        '''
        解压版本包
        :return:
        '''
        with connection.cd(self.project_info['target_library']):
            command = 'tar zxvf %s' % (self.release_version_tar)
            result = connection.run(command)

            # TODO: 外层需要加异常捕获,日志记录
            self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                        task_id=self.task_id, status=1, command=result.command,
                                        success=result.stdout, error=result.stderr)
            current_app.logger.info('command: %s  success: %s, error: %s', result.command, result.stdout, result.stderr)

    def post_release(self, connection):
        '''
        6.部署代码到目标机器后要做的任务
        - 切换软链
        - 重启 nginx
        :return:
        '''
        self.post_release_service(connection)

    def post_release_service(self, connection):
        '''
        代码部署完成后,服务启动工作,如: nginx重启
        :param connection:
        :return:
        '''
        with connection.cd(self.project_info['target_root']):
            command = 'service nginx restart'
            result = connection.sudo(command)
            # TODO: 外层需要加异常捕获,日志记录
            self.TaskRecord.save_record(stage=self.stage, sequence=self.sequence, user_id=self.user_id,
                                        task_id=self.task_id, status=1, command=result.command,
                                        success=result.stdout, error=result.stderr)
            current_app.logger.info('command: %s  success: %s, error: %s', result.command, result.stdout, result.stderr)

    def walle_deploy(self):

        self.prev_deploy()
        self.deploy()
        self.post_deploy()

        # server = '172.16.0.231'
        # try:
        #     self.connections[server] = Connection(host=server, user=self.project_info['target_user'])
        #     self.prev_release(self.connections[server])
        #     self.release(self.connections[server])
        #     self.post_release(self.connections[server])
        # except Exception, e:
        #     self.errors[server] = e.message

        for server in self.servers:
            try:
                self.connections[server] = Connection(host=server, user=self.project_info['target_user'])
                self.prev_release(self.connections[server])
                self.release(self.connections[server])
                self.post_release(self.connections[server])
            except Exception, e:
                self.errors[server] = e.message

        return {'success': self.success, 'errors': self.errors}
