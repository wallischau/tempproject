from controller import Controller

class Chamber(Controller):
    def __init__(self, name):
        self.routers = []
        self.device = []
        self.name = name
