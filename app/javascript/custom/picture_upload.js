document.addEventListener('turbo:load', function() {
  const addPictureBtn = document.getElementById('add-picture-btn');
  const picturesContainer = document.querySelector('.new-picture-inputs');

  if (!addPictureBtn || !picturesContainer) return;

  addPictureBtn.addEventListener('click', function() {
    // Create a new picture input box
    const newInputBox = document.createElement('div');
    newInputBox.classList.add('picture-input-box');

    const fileInput = document.createElement('input');
    fileInput.type = 'file';
    fileInput.name = 'restaurant[pictures][]';  // Make sure the name is correct
    fileInput.classList.add('picture-input');
    fileInput.accept = 'image/*'; // Optional, restrict to image files

    newInputBox.appendChild(fileInput);
    picturesContainer.appendChild(newInputBox);
  });
});
