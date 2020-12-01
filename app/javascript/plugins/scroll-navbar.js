const scrollnavbar = () => {
  window.addEventListener('scroll', function(e) {
    const ypos = window.scrollY;
    // console.log(ypos);
    const navbar = document.querySelector('.topnav');
      if (ypos >= 0 && ypos < 300) {
        navbar.style.opacity = '1';
        navbar.style.background = 'transparent';
        navbar.style.margin = '32px 0px 0px 0px';
      }

      if (ypos >= 300 && ypos <= 1700) {
        navbar.style.opacity = '0';
        navbar.style.background = 'transparent';
      }

      if (ypos > 1700) {
        navbar.style.opacity = '1';
        navbar.style.background = '#FAFAFA';
        navbar.style.margin = '0px';
      }

  });
}

export { scrollnavbar };
