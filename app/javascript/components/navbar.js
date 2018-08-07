const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-wagon');
  const banner = document.querySelector('.banner');
  const navbarWrapper = document.querySelector('.navbar-wrapper');

  if (!banner) {
    navbar.classList.add('navbar-wagon-white');
  }
  else {
    navbarWrapper.parentNode.removeChild(navbarWrapper);
  }
  window.addEventListener('scroll', () => {
    if (window.scrollY >= (window.innerHeight)*0.7) {
      navbar.classList.add('navbar-wagon-white');
    } else {
      if (banner) {
        navbar.classList.remove('navbar-wagon-white');
      }
    }
  });
}

export { initUpdateNavbarOnScroll };
