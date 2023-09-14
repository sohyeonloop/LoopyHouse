const modalBt = document.querySelector('.searchMenu');
const modalWrap = document.querySelector('.modal__content-wrap');

const openModalMenu = () => {
  modalWrap.classList.add('modal-open');
}

const closeModalMenu = (event) => {
  const modalContent = document.querySelector('.modal__content-container');

  if(modalContent !== event.target && event.target === modalWrap) {
    modalWrap.classList.remove('modal-open');
  }
}

modalBt.addEventListener('click', openModalMenu);
modalWrap.addEventListener('click', closeModalMenu);