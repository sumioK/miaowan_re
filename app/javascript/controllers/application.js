import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }



    if (document.URL.match(/new/)){
        document.addEventListener('DOMContentLoaded', () => {
            const createImageHTML = (blob) => {
            const imageElement = document.getElementById('new-image');
            const blobImage = document.createElement('img');
            blobImage.setAttribute('class', 'new-img')
            blobImage.setAttribute('src', blob);
            imageElement.appendChild(blobImage);
            };
            document.getElementById('post-img').addEventListener('change', (e) => {
            const imageContent = document.querySelector('.new-img');
            if (imageContent){
                imageContent.remove();
            }
            const file = e.target.files[0];
            const blob = window.URL.createObjectURL(file);
            createImageHTML(blob);
            });
        });
    }
    if (document.URL.match(/edit/)){
        document.addEventListener('DOMContentLoaded', () => {
            const createImageHTML = (blob) => {
            const imageElement = document.getElementById('new-image');
            const blobImage = document.createElement('img');
            blobImage.setAttribute('class', 'new-img')
            blobImage.setAttribute('src', blob);
            imageElement.appendChild(blobImage);
            };
            document.getElementById('post-img').addEventListener('change', (e) => {
            const imageContent = document.querySelector('.new-img');
            if (imageContent){
                imageContent.remove();
            }
            const file = e.target.files[0];
            const blob = window.URL.createObjectURL(file);
            createImageHTML(blob);
            });
        });
    }
