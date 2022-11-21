# Spendr

Original App Design Project
===

# SPENDR

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
1. [Networking](#Networking)

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

- [x] User can create an account
- [x] User can login
- [x] User can logout
- [x] User can add and update their income
- [x] User can add expenses to pre-defined categories
- [x] User can view a chart of their divided income

**Optional Nice-to-have Stories**

- [ ] User can delete categories
- [ ] User can create sub-categories

### 2. Screen Archetypes

* Login screen
   * User can create an account
   * User can login
* Dashboard screen
   * User can input and update their income
   * User can add expense
   * User can view current categories
   * User can view a chart of their divided income based on current information
   * User can logout
* Category creation screen
   * User can create categories
   * User can divide their income into different categories
* View Category screen
   * User can view expenses by category
* Add Expense screen
   * User can add their expenses and select category
* Add Income screen
   * User can add their monthly income

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* TBD

**Flow Navigation** (Screen to Screen)

* Login screen -> User can log in or create account
* Dashboard screen
   * Add Income -> User can add their monthly income
   * Add Expense -> User can add an expense
   * Create Category -> User can create a new category
   * View Category -> User can view all categories
   * Logout -> User can logout

## Wireframes
![](https://i.imgur.com/EV0aPd1.jpg)

### [BONUS] Digital Wireframes & Mockups
<img src="https://i.imgur.com/FQSvAMj.jpg" height=200> <img src="https://i.imgur.com/j0ndyqI.jpg" height=200> <img src="https://i.imgur.com/SSVkDfh.jpg" height=200> <img src="https://i.imgur.com/Z5DZMDC.jpg" height=200> <img src="https://i.imgur.com/6hQ7BZK.jpg" height=200> <img src="https://i.imgur.com/1NSAqqi.jpg" height=200> <img src="https://i.imgur.com/axackkn.jpg" height=200> <img src="https://i.imgur.com/OxbfwHO.jpg" height=200> <img src="https://i.imgur.com/skD4Y6u.jpg" height=200> <img src="https://i.imgur.com/0B5pQlN.jpg" height=200> <img src="https://i.imgur.com/caM9AT8.jpg" height=200>

### [BONUS] Interactive Prototype
<a href="https://www.figma.com/proto/CyQlEpk2HPmiVQRvLIRjU5/Spendr?node-id=0%3A1&scaling=scale-down&starting-point-node-id=1%3A2"> Prototype Link </a><br>
<img src="https://i.imgur.com/faWGUa1.gif" width=320>

### Models
|Property | Type | Description |
| -------- | -------- | -------- |
| author | Pointer | Category author |
| monthlyIncome | Number | User's total monthly income |
| expenseName | String | Name of expense |
| expenseForCategory     | Pointer   | What category expense should be added to |
| expenseAmount | Number | Amount user delegates to an expense |
| expenseDate | DateTime | Date when expense was logged |
| expenseNotes | String | Additional expense information |
| categoryName | String | Name of category |
| categoryColor | Color | Color for category |
| categoryNotes | String | Additional category information|

## Networking
* Dashboard screen
   * (Read/GET) Query the pie chart based on overall income

```
let query = PFQuery(className:"Category")
query.whereKey("categoryName", equalTo:"categoryType")
query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
    if let error = error {
        // Log details of the failure
        print(error.localizedDescription)
    } else if let objects = objects {
        // The find succeeded.
        print("Successfully retrieved \(objects.count) scores.")
        // Do something with the found objects
        for object in objects {
            print(object.objectId as Any)
        }
    }
}
```

* Category/Expense creation screen
   * (Create/POST) Create and save a new category

```
PFObject *category = [PFObject objectWithClassName:@"Category"];
category[@"name"] = @Auto;
category[@"color"] = @#000000;
category[@"notes"] = @"Monthly car payment";
[category saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
  if (succeeded) {
    // The object has been saved.
  } else {
    // There was a problem, check error.description
  }
}];
```

* Category Selection Screen
   * (Read/GET) Pull up all of user's created categories

```
let query = PFQuery(className:"Category")
query.getObjectInBackground(withId: "xWMyZEGZ") { (category, error) in
    if error == nil {
        // Success!
    } else {
        // Fail!
    }
}
```


* Individual category screen
    * (Read/GET) Pull up all of user's created expenses for that category

```
let query = PFQuery(className:"Expense")
query.getObjectInBackground(withId: "xWMyZEGZ") { (category, error) in
    if error == nil {
        // Success!
    } else {
        // Fail!
    }
}
```

* Individual category screen
   * (Update/PUT) Update category/expense information

```
let query = PFQuery(className:"Category")
query.getObjectInBackground(withId: "xWMyZEGZ") { (gameScore: PFObject?, error: Error?) in
    if let error = error {
        print(error.localizedDescription)
    } else if let category = category {
        category[@"name"] = @Auto;
        category[@"color"] = @#000000;
        category[@"notes"] = @"Monthly car payment";
        category.saveInBackground()
    }
}
```

* Individual category screen
   * (Delete) Delete existing category/expense

```
PFObject.deleteAll(inBackground: objectArray) { (succeeded, error) in
    if (succeeded) {
        // The array of objects was successfully deleted.
    } else {
        // There was an error. Check the errors localizedDescription.
    }
}
```
