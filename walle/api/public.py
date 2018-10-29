# -*- coding: utf-8 -*-
"""

    walle-web

    :copyright: © 2015-2017 walle-web.io
    :created time: 2017-03-25 11:15:01
    :author: wushuiyong@walle-web.io
"""

import os
from flask import request,abort
from walle.api.api import ApiResource
from walle.model.deploy import TaskRecordModel
from walle.model.user import AccessModel
from walle.model.user import UserModel
from walle.service import emails
from walle.service.deployer import Deployer
from walle.service.websocket import WSHandler
from werkzeug.utils import secure_filename


class PublicAPI(ApiResource):
    def get(self, action):
        """
        fetch role list or one role

        :return:
        """

        if action and action in self.action:
            self_action = getattr(self, action.lower(), None)
            return self_action()
        else:
            abort(404)


    def post(self, action):
        """
        fetch role list or one role

        :return:
        """
        if action == 'avater':
            return self.avater()

    def menu(self):
        user = UserModel(id=1).item()
        menu = AccessModel().menu('x')
        data = {
            'user': user,
            'menu': menu,
        }
        return self.render_json(data=data)

    def avater(self):
        UPLOAD_FOLDER = 'fe/public/avater'
        f = request.files['avater']
        fname = secure_filename(f.filename)
        # todo rename to uid relation
        fname = secure_filename(f.filename)
        ret = f.save(os.path.join(UPLOAD_FOLDER, fname))

        return self.render_json(data={
            'avarter': fname,
        })

    def mail(self):
        ret = 'x'
        ret = emails.send_email('wushuiyong@renrenche.com', 'email from service@walle-web.io', 'xxxxxxx', 'yyyyyyy')
        return self.render_json(data={
            'avarter': 'emails.send_email',
            'done': ret,
        })

    def websocket(self, task_id=None):
        task_id = 12
        wi = Deployer(task_id)
        ret = wi.walle_deploy()
        record = TaskRecordModel().fetch(task_id)
        return self.render_json(data={
            'command': ret,
            'record': record,
        })
