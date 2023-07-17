class Order():

    # Class initializer. It has 5 custom parameters, with the
    # special `self` parameter that every method on a class
    # needs as the first parameter.
    def __init__(self, id, metalId, styleId, sizeId, timeStamp):
        self.id = id
        self.metalId = metalId
        self.styleId = styleId
        self.sizeId = sizeId
        self.timeStamp = timeStamp
