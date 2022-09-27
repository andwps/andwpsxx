lass paylocity(Resource):
def __init__(self):
    self.reqparse = reqparse.RequestParser()

def get(self):
    return 200

def post(self):
    try:
        if request.json:
            data = request.json
            query = data['dataset']

        pcty = PaylocityAPI()
        pcty.auth()
        pcty.get_employees()
        pcty.get_paystatements()
        pcty.load_dataset()
        pcty.clean_up()

    except Exception as e:
        print(traceback.print_exc(e))
        raise ValueError(e)

    return 200
