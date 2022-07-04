# Vet Clinic

This projects uses rational database for a vet clinic. I am creating a table of animal, inserting and selecting some of them.


## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

## Prerequisites

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

## Authors

👤 **Emilia Zambrano**

- GitHub: [@emiliazm](https://github.com/emiliazm)
- Twitter: [@emilia_zm](https://twitter.com/emilia_zm)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/emilia-zambrano-montero-aa30a611b/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse.

## 📝 License

This project is [MIT](./MIT.md) licensed.
