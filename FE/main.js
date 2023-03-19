'use strict';

//================================================================

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const btn = $('.button');
const wrapper = $('.wrapper');

btn.addEventListener('click', function () {
  this.classList.add('hide');
  wrapper.classList.remove('hide');
});