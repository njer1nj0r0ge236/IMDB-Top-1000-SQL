# IMDB-Top-1000-SQL
# IMDb Analysis with SQL

**Day 2 of the #22in7 Data Challenge**

This project contains a series of SQL queries exploring the [IMDb Top 1000 Movies](https://www.kaggle.com/datasets/octopusteam/imdb-top-1000-movies/data) dataset. Using SQL Server, I analyzed various aspects of the dataset, including top-rated movies, vote distributions, genre trends by decade, hidden gems, and more.

## Table of Contents

- [Overview](#overview)
- [Dataset](#dataset)
- [Queries and Insights](#queries-and-insights)
  - [Top 10 Highest-Rated Movies with the Most Votes](#1-top-10-highest-rated-movies-with-the-most-votes)
  - [Most Voted Movies](#2-most-voted-movies)
  - [Number of Movies by Decade](#3-number-of-movies-by-decade)
  - [Most Popular Genres by Number of Votes](#4-most-popular-genres-by-number-of-votes)
  - [Top 5 Movies Per Decade](#5-top-5-movies-per-decade)
  - [Movies with More Than 1 Million Votes](#6-movies-with-more-than-1-million-votes)
  - [Best Movies of Each Year (Last 20 Years)](#7-best-movies-of-each-year-last-20-years)
  - [Movies with the Worst Ratings (but a lot of votes)](#8-movies-with-the-worst-ratings-but-a-lot-of-votes)
  - [Find Hidden Gems: High Rating, Low Votes](#9-find-hidden-gems-high-rating-low-votes)
  - [Which Genres Dominate Certain Decades](#10-which-genres-dominate-certain-decades)
  - [Do More Votes Always Mean Higher Ratings](#11-do-more-votes-always-mean-higher-ratings)
- [Usage](#usage)
- [License](#license)
- [Contact](#contact)

## Overview

As part of my 7-day consistency challenge (#22in7), I decided to dive into the IMDb Top 1000 Movies dataset using SQL Server. This project highlights insights such as:
- Top movies by rating and votes
- Genre trends across decades
- Hidden gems that are highly rated but have relatively few votes
- How vote count correlates (or doesn’t) with ratings

## Dataset

The dataset is sourced from Kaggle and contains the following columns:
- `id`: IMDb ID  
- `title`: Movie Title  
- `genres`: Movie Genres (comma-separated)  
- `averageRating`: Average Rating  
- `numVotes`: Number of Votes  
- `releaseYear`: Year of Release

> **Note:** Before importing, the CSV file was cleaned to ensure proper formatting and to avoid issues with text truncation.

## Queries and Insights

The .sql file above shows a summary of the key SQL queries and the insights obtained from them.

## 📌 Usage
Clone the repository:

git clone https://github.com/njer1nj0r0ge236/IMDB-Top-1000-SQL.git
Open SQL Server Management Studio (SSMS).

Use the provided SQL scripts to create and query the imdb_top_1000 table.

Explore the queries and review the insights included in each SQL block.

## 📄 License
This project is licensed under the MIT License.

## 📬 Contact
If you have any questions, feedback, or collaboration ideas:
Email: njorogediana236@gmail.com
LinkedIn: https://www.linkedin.com/in/marydiana-njoroge-41b236244/





