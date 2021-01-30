import Typed from 'typed.js';

const typer = () => {
  if (document.getElementById('typed')) {
    new Typed('#typed', {
      strings: ['dinner parties', 'weekly meal-prep', 'yourself bruh'],
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
