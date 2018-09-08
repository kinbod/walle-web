# -*- coding: utf-8 -*-
"""
    walle-web

    :copyright: © 2015-2019 walle-web.io
    :created time: 2018-09-06 20:20:33
    :author: wushuiyong@walle-web.io
"""
import anyjson as json
from tornado.websocket import WebSocketHandler
from flask import current_app


class WSHandler(WebSocketHandler):
    waiters = set()

    def check_origin(self, origin):
        return True

    def open(self):
        # TODO
        WSHandler.waiters.add(self)

        print 'new connection'
        self.write_message(json.dumps(dict(output="Hello World")))

    def on_message(self, incoming):
        print 'message received %s' % incoming

        text = json.loads(incoming).get('text', None)
        msg = text if text else 'Sorry could you repeat?'

        response = json.dumps(dict(output='receive: {0}'.format(msg)))
        self.write_message(response)

    def on_close(self):
        print 'connection closed'


    @classmethod
    def send_updates(cls, incoming):
        response = json.dumps(dict(output='update: {0}'.format(incoming)))
        current_app.logger.info("sending %s to %d waiters", incoming, len(cls.waiters))
        current_app.logger.info(cls.waiters)
        for waiter in cls.waiters:
            try:
                waiter.write_message(response)
            except Exception, e:
                current_app.logger.exception(e)


