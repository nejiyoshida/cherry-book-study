require "./lib/deep_freezable"

class Team
    extend DeepFreezable
    
    # classの構文下では、ふつうのメソッドは呼べないのでextend
    COUNTRIES = deep_freeze(["Japan", "US", "India"])
end
