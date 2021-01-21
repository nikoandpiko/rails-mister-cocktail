import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["乾杯！", "Cheers!", "Santé!", "Salute!", "건배!", "Skål!", "Будем здоровы!", "ΥΓΕΙΑ!", "Proost!", "干杯!", "Na zdravi!"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
