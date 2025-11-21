// Fareed 12032192
// CSCI410 Mobile Application Project 1


class Pricing {
  static Map<String, int> _servicePrices = { "Haircut": 10, "Beard": 5, "Full Service": 15,
};

  static Map<String, int> _serviceTimes = {
    "Haircut": 20,
    "Beard": 10,
    "Full Service": 30,
  };

  static int stylingPrice = 5;
  static int faceMaskPrice = 5;

  static int stylingTime = 5;
  static int faceMaskTime = 7;

  static Map<String, int> calculatePrice({
    required String? mainService,
    required bool styling,
    required bool faceMask,
  }) {
    int price = 0;
    int time = 0;

    if (mainService != null) {
      price += _servicePrices[mainService]!;
      time += _serviceTimes[mainService]!;
    }

    if (mainService != "Full Service") {
      if (styling) {
        price += stylingPrice;
        time += stylingTime;
      }
      if (faceMask) {
        price += faceMaskPrice;
        time += faceMaskTime;
      }
    }

    return {
      "price": price,
      "time": time,
    };
  }
}




