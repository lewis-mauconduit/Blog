'use strict';

var addAuthor = document.getElementById('addAuthor');
addAuthor.addEventListener('click', showFormAuthor);

function showFormAuthor(){
    var formAddAuthor = document.querySelector('.formAddAuthor');
    formAddAuthor.classList.toggle('hidden');
}

var addCategory = document.getElementById('addCategory');
addCategory.addEventListener('click', showFormCategory);

function showFormCategory(){
    var formAddCategory = document.querySelector('.formAddCategory');
    formAddCategory.classList.toggle('hidden');
}