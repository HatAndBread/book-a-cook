import Typed from 'typed.js';

const typer = () => {
  if (document.getElementById('typed')) {
    new Typed('#typed', {
      strings: ['casual parties', 'weekly meal-prep', 'holidays'],
      typeSpeed: 40,
      backSpeed: 0,
      cursorChar: '',
      shuffle: true,
      smartBackspace: false,
      loop: true
    });
  }
}

typer();
