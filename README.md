# snax
1) App Name: Snax
2) App Tagline: Students Order, Students Deliver 
3) Link to Backend: https://github.com/seancorc/snax-backend
4) Screenshots:

![alt text](https://github.com/jsb459/snax/blob/master/screenshots/img0.png)
![alt text](https://github.com/jsb459/snax/blob/master/screenshots/img1.png)
![alt text](https://github.com/jsb459/snax/blob/master/screenshots/img2.png)
![alt text](https://github.com/jsb459/snax/blob/master/screenshots/img3.png)
![alt text](https://github.com/jsb459/snax/blob/master/screenshots/img4.png)
![alt text](https://github.com/jsb459/snax/blob/master/screenshots/img5.png)
![alt text](https://github.com/jsb459/snax/blob/master/screenshots/img6.png)

5) Short Description of App: Purpose and features
	Purpose: To lower the barrier of entry to the job market, specifically the food delivery market through seamless switching between ordering and delivering.
	Features: 
  Already Integrated: 
  -See and filter through restaurants, see menu items, see a map of Ithaca, and log in using your Google account, add items from a restaurant to a cart and see total price. 
  Plan on Integrating: 
  -Send out delivery request to snaxsters (deliverers), track the snaxsters using our map, payment methods. 
  
6) How we address the requirements:

-AutoLayout using NSLayoutConstraint:
We used NSLayoutConstraint to set up the placement of all of our view controllers.
-At least one UICollectionView or UITableView:
We implemented a UICollectionView made up of instances of RestaurantCollectionViewCell to display the array of restaurants for which our app would let users order/deliver from.
We implemented a UITableView to display each restaurant’s menu as a list of menu items. It was made up of instances of DetailTableViewCell.
-Some form of navigation (UINavigationController or UITabBarController) to navigate between screens:
Our main form of navigation was a UITabBarController that navigated between 4 main view controller screens: ViewController, AccountViewController, CartViewController, and DeliveryViewController.
When the user clicks on a restaurant on ViewController, we push the DetailViewController. When the user clicks on a menu item, we present another view controller modally. There are a number of other smaller modal view controllers and navigation 
controllers also implemented with actions such as button push.
-Integration with an API - this API must provide some meaningful value to your app. For example, if you’re creating a music app, you could use the Apple Music API. Most of you will integrate with an API written by students in the backend course.
We integrated with an API written by students in backend, as well as with the Google Sign In API. We used the Google Sign In API to log in using a google account and retrieve basic information about the user. We stored some of that information 
into our personal backend database and added user specific information based on 
their activity in the app (i.e. order number, ordered items, a unique id). We also use the backend database by making a get request for the menu of each restaurant, and loading these menu items into a UITableView. 
Ideally, we use our backend database to make a number of get/post requests, such as creating users, getting users, getting menus, etc.


7) Other Comments: 
We know we have yet to integrate a number of features. For example, we want only those with Cornell.edu addresses should be able to access the app. 
People with such an address are by and large capable of ordering and delivering food. Therefore, Snax users would not have to apply to work as a 
deliverer. There is much to be done for our current project to become an actual functioning application, but we hope that we have provides a good
outline for you to see what we plan on doing with it in the future. 
