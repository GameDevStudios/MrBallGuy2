function AchievementSystemConfig(achievementSystem)

    achievementSystem:CreateAchievement("1_coin", "Look! A penny!", "Collect 1 coin", "ach1.png")
    achievementSystem:CreateAchievement("50_coin", "50 coins!", "Collect 50 coins", "ach1.png")
    achievementSystem:CreateAchievement("100_coin", "100 pennies!", "Collect 100 coins", "ach1.png")
    achievementSystem:CreateAchievement("200_coin", "Fairly rich...", "Collect 200 coins", "ach1.png")
    achievementSystem:CreateAchievement("500_coin", "Almost at 1,000!", "Collect 500 coins", "ach1.png")
    achievementSystem:CreateAchievement("1000_coin", "Just think: 1,000\npennies!", "\n\nCollect 1,000 coins", "ach1.png")
    achievementSystem:CreateAchievement("2000_coin", "Rolling in money!", "Collect 2,000 coins", "ach1.png")
    achievementSystem:CreateAchievement("5000_coin", "5000 coins!?!?", "Collect 5,000 coins", "ach1.png")
    achievementSystem:CreateAchievement("10000_coin", "I think you hacked!", "Collect 10,000 coins", "ach1.png")
    achievementSystem:CreateAchievement("20000_coin", "RICH!", "Collect 20,000 coins", "ach1.png")
    achievementSystem:CreateAchievement("50000_coin", "You're insane!!", "Collect 50,000 coins!", "ach1.png")
    achievementSystem:CreateAchievement("100000_coin", "Too much money", "Collect 100,000 coins!", "ach1.png")

    achievementSystem:CreateAchievement("1000_score", "Pttf! Such a noob!", "Get 1000 points!", "ach1.png")
    achievementSystem:CreateAchievement("2000_score", "Learning...", "Get 2000 points", "ach1.png")
    achievementSystem:CreateAchievement("5000_score", "Ball Dodger 3rd class!", "Get 5000 points!", "ach1.png")

    achievementSystem:SetButton("b")

end