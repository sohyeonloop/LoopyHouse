//글쓰기 
const writeBt = document.querySelector('.header-upper__writeBt');
const writeMenu = document.querySelector('.header-upper__lists');

const openWriteMenu = () => {
  writeMenu.classList.add('openWirteMenu');
}

const closeWriteMenu = (event) => {
  if (event.target !== writeMenu && event.target !== writeBt) {
    writeMenu.classList.remove('openWirteMenu');
  }
}

writeBt.addEventListener("click", openWriteMenu);
window.addEventListener("click", closeWriteMenu);



//인기검색어 

let topicMenu = document.querySelector('.topic_name');
let topicList = document.querySelector('#topic_lists');

topicMenu.addEventListener('mouseenter', function() {
  topicList.classList.add('tpactive');
  // topicMenu.style.fontSize = '20px';
});

topicMenu.addEventListener('mouseleave', function() {
  topicList.classList.remove('tpactive');
});

topicList.addEventListener('mouseenter', function() {
  topicList.classList.add('tpactive');
});

topicList.addEventListener('mouseleave', function() {
  topicList.classList.remove('tpactive');
});



