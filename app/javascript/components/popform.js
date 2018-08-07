const initAddCocktail = () => {
    const addCocktail = document.getElementById('add-cocktail');
    const popForm = document.getElementById('popup-form')
    console.log('Hello from Popform');

  const addForm = (event) => {
    event.preventDefault();

    popForm.classList.toggle('hidden');
    console.log('Hello from addForm');
  }

  addCocktail.addEventListener("click", addForm);
}

export { initAddCocktail };

