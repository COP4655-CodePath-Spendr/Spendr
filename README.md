# Spendr

Original App Design Project - README Template
===

# SPENDR

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
The Spendr app will allow users to budget their income in a simple and straightforward way. The app will create a visual chart for users to see where their money is being delegated to.

### App Evaluation
- **Category:** Productivity / Lifestyle
- **Mobile:** Mobile first experience, website is view only.
- **Story:** Allows users to organize and track and divide their income.
- **Market:** Marketed towards people who want a way to budget their income.
- **Habit:** Users would normally check the app as often as they want to update their budget or expenses.
- **Scope:** Allows users to enter their total income, create categories, and delegate the amount of money they want to assign to that category.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can create an account
* User can login
* User can logout
* User can input and update their income
* User can view and create categories
* User can divide their income into different categories
* User can view a chart of their divided income

**Optional Nice-to-have Stories**

* User can delete categories
* User can create sub-categories

### 2. Screen Archetypes

* Login screen
   * User can create an account
   * User can login
* Dashboard screen
   * User can input and update their income
   * User can view current categories
   * User can view a chart of their divided income based on current information
   * User can logout
* Category creation screen
   * User can create categories
   * User can divide their income into different categories

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Dashboard screen
* Create category

**Flow Navigation** (Screen to Screen)

* Login screen
   * => Home
* Dashboard screen
   * => Category creation screen
   * => Login Screen (Upon logout)
* Category creation screen
   * => Home screen
