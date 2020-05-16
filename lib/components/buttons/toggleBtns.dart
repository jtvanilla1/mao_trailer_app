void toggleBtns(List<bool> isSelected, int index) {
  for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++)
    if (buttonIndex == index) {
      isSelected[buttonIndex] = true;
    } else {
      isSelected[buttonIndex] = false;
    }
}