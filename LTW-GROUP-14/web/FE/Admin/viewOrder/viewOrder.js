const currentPosition = localStorage.getItem('prevLocation');
    if (currentPosition) window.scrollTo(0, currentPosition);

    document.addEventListener('scroll', () => {
      localStorage.setItem('prevLocation', window.scrollY);
    });

function submitForm(classForm){
    document.querySelector('.' + classForm).submit();
}


