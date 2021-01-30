import c from 'chinpunkanpun';

const reviews = Array.from(document.querySelectorAll('.review-text'));
reviews.forEach((review) => {
  review.innerText = `${c.sentence()} ${c.sentence()} ${c.sentence()}`;
});
