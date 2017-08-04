DROP SCHEMA IF EXISTS recipes;
CREATE SCHEMA recipes;

DROP TABLE IF EXISTS tblCuisine;
DROP TABLE IF EXISTS tblRecipes;
DROP TABLE IF EXISTS tblIngredients;
DROP TABLE IF EXISTS tblGroceryList;

CREATE TABLE tblCuisine
(
	cuisine_id INT PRIMARY KEY,
    geography VARCHAR(25) NOT NULL
);

INSERT INTO tblCuisine
(cuisine_id, geography)
VALUES
(1, 'Korean'),
(2, 'French'),
(3, 'Italian'),
(5, 'Moroccan');

CREATE TABLE tblRecipes
(
	recipe_id INT PRIMARY KEY,
    recipe VARCHAR(25) NOT NULL,
    cuisine_id INT NULL REFERENCES tblCuisine(cuisine_id)
);

INSERT INTO tblRecipes
(recipe_id, recipe, cuisine_id)
VALUES
(1, 'Penne a la vodka', 3),
(2, 'Pizza', NULL),
(3, 'Cassoulet', 2),
(4, 'Bulgogi', 1),
(5, 'Kimchi', 1),
(7, 'Escargot', 2);

CREATE TABLE tblIngredients
(
	ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    ingredient VARCHAR(25) NOT NULL
);

INSERT INTO tblIngredients
(ingredient)
VALUES
('Beef'),
('Tomato Sauce'),
('Snails'),
('Cabbage'),
('Penne'),
('Onions'),
('White beans'),
('Duck'),
('Tomato'),
('Flour');

CREATE TABLE tblGroceryList
(
	recipe_id INT NOT NULL REFERENCES tblRecipes(recipe_id),
    ingredient_id INT NOT NULL REFERENCES tblIngredients(ingredient_id),
    quantity INT NOT NULL
);

INSERT INTO tblGroceryList
(recipe_id, ingredient_id, quantity)
VALUES
(4, 6, 2),
(4, 1, 1),
(5, 6, 1),
(5, 4, 3),
(3, 6, 2),
(3, 7, 100),
(3, 8, 2),
(2, 9, 7),
(2, 10, 1);

SELECT
IFNULL(Recipes.recipe, "n/a") AS `Recipe`,
IFNULL(Cuisines.geography, "Unknown origin") AS `Origin`,
IFNULL(Ingredients.ingredient, "n/a") AS `Ingredient`,
IFNULL(Groceries.quantity, 0) AS `Quantity`

FROM tblRecipes AS Recipes
LEFT JOIN tblCuisine AS Cuisines
ON Recipes.cuisine_id = Cuisines.cuisine_id
LEFT JOIN
(
tblGroceryList as Groceries
LEFT JOIN tblIngredients AS Ingredients
ON Groceries.ingredient_id = Ingredients.ingredient_id
)
ON Recipes.recipe_id = Groceries.recipe_id
ORDER BY Recipe, Origin, Ingredient, Quantity;