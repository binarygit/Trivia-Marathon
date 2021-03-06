# Trivia Marathon

I made this website to play with an external API. The API is [The Open Trivia Database](https://opentdb.com/api_config.php). It was fun working with it. The website itself is a simple game where the player tries to answer as many questions as he can.

Here is the live site: https://cryptic-sierra-10012.herokuapp.com

![image](https://user-images.githubusercontent.com/87677429/171020230-6776cf3c-4dae-4bf0-97ff-da0dc7d41ec4.png)

# Challenges

1. Making the app stateful.
2. Testing the external api.

I quickly realized that the database did not have a major role in such an app (except storing information for the leaderboard). I had to find a way to store the _question_, the _correct answer_, the _incorrect answers_ and the _score_ somehow. Ofcourse I used the cookies hash.

I have not figured out the testing part as of now. Stubbing the controller method `fetch_question` is yielding a `NoMethodError stub` on the class. Even when I try to stub an instance of it, I get the same error.
I am intrigued by this [article](https://stackoverflow.com/questions/53558185/stubbing-with-ruby-on-rails-and-minitest) that suggests wrapping the API call in a seperate object and testing it.

# Key Implementations

1. Integrating external API.
2. Responsive Design.
