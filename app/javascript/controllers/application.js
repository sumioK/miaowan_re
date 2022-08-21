import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener('turbolinks:load', () => {
    console.log('Loaded');
});

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



(()=>{
    const $doc = document;
    const $tab = $doc.getElementById("js-tab");
    const $nav = $tab.querySelectorAll('[data-nav]');
    const $content = $tab.querySelectorAll('[data-content]')
    const ACTIVE_CLASS = 'is-active'
    const navLength = $nav.length


    const init =() =>{
        $content[0].style.display = "flex";
    }
    init();


    const handleClick = (e) => {
        e.preventDefault();
        
        const $this = e.target;
        const targetValue = $this.dataset.nav

        let index = 0;
        while(index < navLength) {
            $content[index].style.display = 'none';
            $nav[index].classList.remove(ACTIVE_CLASS)
            index++;
        }

        $tab.querySelectorAll('[data-content="' + targetValue + '"]')[0].style.display = "flex"
        $nav[targetValue].classList.add(ACTIVE_CLASS)
        
    }
    
    let index = 0;
    while(index < navLength){
    $nav[index].addEventListener('click' , (e) => handleClick(e));
    index ++;
    }
})();