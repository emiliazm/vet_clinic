# Vet Clinic

This projects uses rational database for a vet clinic. I am creating a table of animal, inserting and selecting some of them.


## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

## Prerequisites

#### Day 1 requirements
- Use [this template](https://github.com/microverseinc/curriculum-template-databases) to generate your repo.
- Create a database named `vet_clinic`.
- Create a table named `animals` with the following columns:
  - `id`: integer
  - `name`: string
  - `date_of_birth`: date
  - `escape_attempts`: integer
  - `neutered`: boolean
  - `weight_kg`: decimal
- Copy the SQL you used in the previous point into the `schema.sql` file in the generated repository.
- Insert the following data:
  - Animal: His name is Agumon. He was born on Feb 3rd, 2020, and currently weighs 10.23kg. He was neutered and he has never tried to escape.
  - Animal: Her name is Gabumon. She was born on Nov 15th, 2018, and currently weighs 8kg. She is neutered and she has tried to escape 2 times.
  - Animal: His name is Pikachu. He was born on Jan 7th, 2021, and currently weighs 15.04kg. He was not neutered and he has tried to escape once.
  - Animal: Her name is Devimon. She was born on May 12th, 2017, and currently weighs 11kg. She is neutered and she has tried to escape 5 times.
- Copy the SQL you used in the previous point into the `data.sql` file in the generated repository.
- Write queries for the following quests:
  - Find all animals whose name ends in "mon".
  - List the name of all animals born between 2016 and 2019.
  - List the name of all animals that are neutered and have less than 3 escape attempts.
  - List the date of birth of all animals named either "Agumon" or "Pikachu".
  - List name and escape attempts of animals that weigh more than 10.5kg
  - Find all animals that are neutered.
  - Find all animals not named Gabumon.
  - Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
- **Take a screenshot of the results of your queries.**
- Copy the SQL you used in the previous point into the `queries.sql` file in the generated repository.
- Remember to add the screenshot with the results of your queries to your Pull Request description.

#### Day 2 requirements
- Add a column `species` of type `string` to your `animals` table. Modify your `schema.sql` file.
- Insert the following data:
  - Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape.
  - Animal: Her name is Plantmon. She was born on Nov 15th, 2021, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times.
  - Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to escape 3 times.
  - Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once.
  - Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times.
  - Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times.
  - Animal: His name is Ditto. He was born on May 14th, 2022, and currently weighs 22kg. He is neutered and he has tried to escape 4 times.
- Remember to add these insertions to your `data.sql` file.

----

- Inside a transaction update the `animals` table by setting the `species` column to `unspecified`. Verify that change was made. Then roll back the change and verify that the `species` columns went back to the state before the transaction.
- Inside a transaction:
  - Update the `animals` table by setting the `species` column to `digimon` for all animals that have a name ending in `mon`.
  - Update the `animals` table by setting the `species` column to `pokemon` for all animals that don't have `species` already set.
  - Commit the transaction.
  - Verify that change was made and persists after commit.
- **Take a screenshot of the results of your actions.**
- Now, take a deep breath and... **Inside a transaction** delete all records in the `animals` table, then roll back the transaction.
- After the rollback verify if all records in the `animals` table still exists. After that, you can start breathing as usual ;) 
- **Take a screenshot of the results of your actions.**
- Inside a transaction:
  - Delete all animals born after Jan 1st, 2022.
  - Create a savepoint for the transaction.
  - Update all animals' weight to be their weight multiplied by -1.
  - Rollback to the savepoint
  - Update all animals' weights that are negative to be their weight multiplied by -1.
  - Commit transaction
- **Take a screenshot of the results of your actions.**

----
- Write queries to answer the following questions:
  - How many animals are there?
  - How many animals have never tried to escape?
  - What is the average weight of animals?
  - Who escapes the most, neutered or not neutered animals?
  - What is the minimum and maximum weight of each type of animal?
  - What is the average number of escape attempts per animal type of those born between 1990 and 2000?
- **Take a screenshot of the results of your queries.**
- Remember to add these queries to your `queries.sql` file.
- Remember to add screenshots with the results of your queries and with the results of your play with transactions to your Pull Request description.

#### Day 3 requirements
- Create a table named `owners` with the following columns:
  - `id`: integer (set it as autoincremented PRIMARY KEY)
  - `full_name`: string
  - `age`: integer
- Create a table named `species` with the following columns:
  - `id`: integer (set it as autoincremented PRIMARY KEY)
  - `name`: string
- Modify `animals` table:
  - Make sure that id is set as autoincremented PRIMARY KEY
  - Remove column `species`
  - Add column `species_id` which is a foreign key referencing `species` table
  - Add column `owner_id` which is a foreign key referencing the `owners` table
- Remember all this goes in `schema.sql`.
- Insert the following data into the `owners` table:
  - Sam Smith 34 years old.
  - Jennifer Orwell 19 years old.
  - Bob 45 years old.
  - Melody Pond 77 years old.
  - Dean Winchester 14 years old.
  - Jodie Whittaker 38 years old.
- Insert the following data into the `species` table:
  - Pokemon
  - Digimon
- Modify your inserted animals so it includes the `species_id` value:
  - If the name ends in "mon" it will be Digimon
  - All other animals are Pokemon
- Modify your inserted animals to include owner information (`owner_id`):
  - Sam Smith owns Agumon.
  - Jennifer Orwell owns Gabumon and Pikachu.
  - Bob owns Devimon and Plantmon.
  - Melody Pond owns Charmander, Squirtle, and Blossom.
  - Dean Winchester owns Angemon and Boarmon.
- Remember these insertions and modifications happen in `data.sql`.
- Write queries (using `JOIN`) to answer the following questions:
  - What animals belong to Melody Pond?
  - List of all animals that are pokemon (their type is Pokemon).
  - List all owners and their animals, remember to include those that don't own any animal.
  - How many animals are there per species?
  - List all Digimon owned by Jennifer Orwell.
  - List all animals owned by Dean Winchester that haven't tried to escape.
  - Who owns the most animals?
- **Take a screenshot of the results of your queries.**
- Remember to add the screenshot with the results of your queries to your Pull Request description.

#### Day 4 requirements
- Create a table named `vets` with the following columns:
  - `id`: integer (set it as autoincremented PRIMARY KEY)
  - `name`: string
  - `age`: integer
  - `date_of_graduation`: date
- There is a **many-to-many** relationship between the tables `species` and `vets`: a vet can specialize in multiple species, and a species can have multiple vets specialized in it. Create a "join table" called `specializations` to handle this relationship.
- There is a **many-to-many** relationship between the tables `animals` and `vets`: an animal can visit multiple vets and one vet can be visited by multiple animals. Create a "join table" called `visits` to handle this relationship, it should also keep track of the date of the visit.
- Insert the following data for vets:
  - Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
  - Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
  - Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
  - Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
- Insert the following data for specialties:
  - Vet William Tatcher is specialized in Pokemon.
  - Vet Stephanie Mendez is specialized in Digimon and Pokemon.
  - Vet Jack Harkness is specialized in Digimon.
- Insert the following data for visits:
  - Agumon visited William Tatcher on May 24th, 2020.
  - Agumon visited Stephanie Mendez on Jul 22th, 2020.
  - Gabumon visited Jack Harkness on Feb 2nd, 2021.
  - Pikachu visited Maisy Smith on Jan 5th, 2020.
  - Pikachu visited Maisy Smith on Mar 8th, 2020.
  - Pikachu visited Maisy Smith on May 14th, 2020.
  - Devimon visited Stephanie Mendez on May 4th, 2021.
  - Charmander visited Jack Harkness on Feb 24th, 2021.
  - Plantmon visited Maisy Smith on Dec 21st, 2019.
  - Plantmon visited William Tatcher on Aug 10th, 2020.
  - Plantmon visited Maisy Smith on Apr 7th, 2021.
  - Squirtle visited Stephanie Mendez on Sep 29th, 2019.
  - Angemon visited Jack Harkness on Oct 3rd, 2020.
  - Angemon visited Jack Harkness on Nov 4th, 2020.
  - Boarmon visited Maisy Smith on Jan 24th, 2019.
  - Boarmon visited Maisy Smith on May 15th, 2019.
  - Boarmon visited Maisy Smith on Feb 27th, 2020.
  - Boarmon visited Maisy Smith on Aug 3rd, 2020.
  - Blossom visited Stephanie Mendez on May 24th, 2020.
  - Blossom visited William Tatcher on Jan 11th, 2021.
- Write queries to answer the following:
  - Who was the last animal seen by William Tatcher?
  - How many different animals did Stephanie Mendez see?
  - List all vets and their specialties, including vets with no specialties.
  - List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
  - What animal has the most visits to vets?
  - Who was Maisy Smith's first visit?
  - Details for most recent visit: animal information, vet information, and date of visit.
  - How many visits were with a vet that did not specialize in that animal's species?
  - What specialty should Maisy Smith consider getting? Look for the species she gets the most.
- **Take a screenshot of the results of your queries.**
- Remember to add the screenshot with the results of your queries to your Pull Request description.

## Authors

👤 **Emilia Zambrano**

- GitHub: [@emiliazm](https://github.com/emiliazm)
- Twitter: [@emilia_zm](https://twitter.com/emilia_zm)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/emilia-zambrano-montero-aa30a611b/)

👤 **Amaury Permer**

- GitHub: [@Trictonicmp](https://github.com/trictonicmp)
- LinkedIn: [Amaury Permer](https://www.linkedin.com/in/amaury-permer/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse.

## 📝 License

This project is [MIT](./MIT.md) licensed.
