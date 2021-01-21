import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["乾杯！", "Cheers!", "I created this myself!", "Just kidding."],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
