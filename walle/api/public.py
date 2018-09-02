# -*- coding: utf-8 -*-
"""

    walle-web

    :copyright: © 2015-2017 walle-web.io
    :created time: 2017-03-25 11:15:01
    :author: wushuiyong@walle-web.io
"""

import os
from flask import request
from walle.api.api import ApiResource
from walle.model.user import AccessModel
from walle.model.user import UserModel
from walle.model.deploy import TaskRecordModel
from walle.service import emails
from walle.service.waller import Waller
from werkzeug.utils import secure_filename


class PublicAPI(ApiResource):
    def get(self, method):
        """
        fetch role list or one role

        :return:
        """
        if method == 'menu':
            return self.menu()
        elif method == 'mail':
            return self.mail()
        elif method == 'walle':
            return self.walless()

    def post(self, method):
        """
        fetch role list or one role

        :return:
        """
        if method == 'avater':
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

    def walless(self):
        wi = Waller(12)
        ret = wi.walle_deploy()
        record = TaskRecordModel().fetch(12)
        return self.render_json(data={
            'command': ret,
            'record': record,
        })

