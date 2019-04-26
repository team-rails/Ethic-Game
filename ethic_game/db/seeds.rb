# Water boiling seeds test sceneario database
# In the future users should have the means to fill this database themselves to create custom scenerios

# Create the sceneraio

# link to seed: https://docs.google.com/spreadsheets/d/1H-mVSDo0hFwUeFb8rHDSiS8RFiM3ZbVd268LSIvMmLI/edit#gid=0

#desc = 'You are a member of a team of public relations officers assigned to a project. This project is a joint alliance between the US and Peruvian governments. Your role on this project tea is to provide public updates on this hight profile project --- a project that is costing the US and Peruvian governments LOTS of money.'
desc = "Welcome to the Ethics role playing game!\n\n Background:
This game is modelled based on the high profile \"Peruvain Water Boiling\" project conducted by the US and Peruvian governments in the Peruvian villages that failed miserably. 

What\'s your role?
You are a member of a team of public relations officers assigned to this project. 
Your role on this project team is to spread awareness about boiling water for drinking among the different groups of villagers through one-on-one interaction with each group.

Learning Outcome:
At the end of this project, you will be able to understand 
-- the importance of communication
-- the impact of ethnocentricity and cultural relativity
-- the influence of worldviews or lack thereof in successful communication
-- the reality that sometimes there is no correct solution or definite path to success"

scenario = Scenario.create!(
    title: 'Water Boiling',
    description: desc,
    created_by: 'me'
    )
    
# Create the groups
groupA = Group.create!(
    name: 'Cacataibo Tribe', 
    population_percentage: 35,
    scenario_id: scenario.id
)

groupB = Group.create!(
    name: 'Murunahua Tribe',
    population_percentage: 55,
    scenario_id: scenario.id
)

groupC = Group.create!(
    name: 'Nanti Tribe', 
    population_percentage: 5,
    scenario_id: scenario.id
)

groupD = Group.create!(
    name: 'Yora Tribe', 
    population_percentage: 5,
    scenario_id: scenario.id
)


#format [Question, points, response_array_index]
groupAPositiveQuestions  = [
    ["Where do you get your water?", 10, 0],
    ["There was a well put in close by, why don't you get your water from the well?", 10, 1],
    ["Why don't you get your water from the spring? It's natural and clean.", 10, 2],
    ["How do you feel drinking the irrigaton water?", 10, 3],
    ["Do you think that others are feeling sick as well?  Are your friends and family experiencing diarrhea?", 10, 4],
    ["Boiled water is good even when you aren't sick. Could you boil your water all the time?", 10, 5],
    ["The team has explained that the water has germs. 
        If you boiled your water all the time you would not get 
        sick over and over again. What do you think about those 
        who do boil their water and aren't sick?", 10, 6],
    ["Would you drink the boiled water if it tasted better?  What can we do to make it taste better?", 10, 7],
    ["The team is trying to help the villagers feel better and 
        find ways to increase boiled water usage.  
        How do you feel about the team being in your village?", 10, 8],
    ["We need this to work and we want to do it quickly.  
      What do you think would help the partnership between the villagers and the team?", 10, 9],
    ["Hello", 0, 10],
    ["How are you?", 0, 11],
    ["What's up ?", 0, 12],
]

#format [Question, points, response_array_index]
groupANegativeQuestions = [
    ["Do you get your water from that dirty hole in the ground?", -10, 0],
    ["Why would you not just go get your water from the clean well?", -10, 1],
    ["Wouldn't the spring water be a better choice then?", -10, 2],
    ["Do you find that your sick often drinking the dirty irrigation water?", -10, 3],
    ["Do most people have diarrhea then?", -10, 4],
    ["If you feel better after boiling water, 
        why wouldn't you just boil your water all the time like you were told?", -10, 5],
    ["We have told you there are germs in the irrigation ditch.  
        Villager C boils their water and doesn't get sick, why don't you do like them?", -10, 6],
    ["How about drinking the boiled water with flavor?", -10, 7],
    ["What about the team trying to help you?", -10, 8],
    ["How can everyone just work together?", -10, 9]
]

groupAResponses = [ #format [Response, points, group_standing_threshold]
    [["I usually collect it from the nearby irrigation ditch. I like how its water tastes.", 4.5, 80],
    ["From the ditch, it has a good taste.", 1, 50], 
    ["From the irrigation ditch, who has time for anything else? Stop wasting my time.", -4.5, 0]],
    
    [["I would, but it has a weird taste to me.  The irrigation water tastes better.", 4.5, 80], 
    ["It doesn't taste right to me.", 1, 50], 
    ["That dirt inspector's well has a funny taste.  I bet they did something to it.", -4.5, 0]],
    
    [["The spring is very far away. After a long day of working in the fields I'm too tired to walk that far.", 4.5, 80], 
    ["It's too far for me.", 1, 50], 
    ["What? And walk all that way!? Who has time for that after a long day of work in the fields.  
    You don't work in the fields, why don't you go get it for me?", -4.5, 0]],
    
    [["Right now, I don't feel very good.  I feel very hot and I have diarrhea.  
        I'm not sure it's the water though.  Sometimes I'm fine and other times I'm sick.", 4.5, 80],
    ["I am very sick now. The visiting doctors say I have a fever, a bad sinus infection, and diarrhea.  
        They say it's from the water, but I don't believe them. It'll go away.", 1, 50],
    ["I don't have to tell you how I feel.  You're not a doctor.", -4.5, 0]],
    
    [["Yes, diarrhea is just part of life.  Many people I know have diarrhea. We just boil our water to get the heat out and then we are fine again.", 4.5, 80], 
    ["Yea, most people have diarrhea.  It's life.", 1, 50], 
    ["I'm not them. You should probably ask them dirt inspector.", -4.5, 0]],
    
    [["We don't need cooked water when we aren't hot.  We need cold things when we feel good.  
    Cooked water wouldn't be good then.  Besides Boiled water taste bad and 
    I have to collect fire wood to boil it. I am not often sick so there's 
    no reason to go through the effort of always boiling my water.", 4.5, 80],
    ["Cooked water is only for the sick and its taste awful.", 1, 50], 
    ["Why would I? I'm not sick all the time. That's just taking extra time for no reason. 
        It also taste awful.  Why would I drink something that's disgusting?", -4.5, 0]],
    
    [["I guess they might not be sick because they boil their water, but
    I don't understand how something can hurt me in the water when the fish 
    are fine.  What are these germs that we can't even see.  I don't know, 
    I just think they're a little strange.  
    Taking extra time to do something that doesn't make any sense. ", 4.5, 80], 
    ["Those newcomers are a little odd.  They don't seem to understand our ways.  I'm not sure why they aren't getting sick. 
    How can it be these germs?  There's nothing to see in the water.", 1, 50], 
    ["The newcomers are very strange and do not follow our traditions. They don't even speak or 
    dress like us. Maybe they believe in these fake germs you talk about but I don't.", -4.5, 0]],
    
    [["Yes, if I had some herbs, lemon, or maybe cinnamon the water would be 
     acceptable to drink, but I still don't have the time to collect wood to cook it.", 4.5, 80],
     ["Maybe if there was a way to flavor it, but that doesn't take away the time it takes.", 1, 50],
     ["Maybe, but I still don't want to spend the time collecting firewood.", -4.5, 0]],
    
    [["I know they are trying to help, but they need to listen to our culture too.  
    They have a long way to go.  Their solutions take too much time 
    and for what? These germ things?  I'm sorry, but I don't really understand.", 4.5, 80],
    ["The team means well, but they don't understand our culture.  I'm not sure what they are going to do.", 1, 50],
    ["The dirt inspectors should leave the village. They don't respect our ways.  Who says we needed them to interfere?", -4.5, 0]],
    
    [["The team needs to talke to more villagers and understand their culture.  
    Maybe join in some of our work and activities? 
    They can't just tell us what to do, they need to understand our point of view too.", 4.5, 80],
    ["I'm not sure how to get everyone to work together.  Good luck with that.", 1, 50],
    ["We can't work together.  There's no point to your team being here.  We didn't ask for your help.", -4.5, 0]],
    
    [["Hello there", 0, 0]],
    
    [["I could be better I suppose", 0, 0]],
    
    [["The sky", 0, 0]],
]

#format [Question, points, response_array_index]
groupBPositiveQuestions = [
    ["Where do you get your water?", 9.09, 0],
    ["Why don't you get your water from the well?", 9.09, 1],
    ["Why don't you get your water from the spring?", 9.09, 2],
    ["How do you feel drinking the irrigaton water?", 9.09, 3],
    ["Do you think that others are feeling sick?  Are your friends and family experiencing diarrhea?", 9.09, 4],
    ["Why don't you boil your water all of the time?", 9.09, 5],
    ["What do you think about those who do boil their water and aren't sick? ", 9.09, 6],
    ["The team has explained that the water has germs. 
        If you boiled your water all the time you would not get 
        sick over and over again.  Boiled water is good even when you aren't sick.  
        Could you boil your water all the time? ", 9.09, 7],
    ["Would you drink the boiled water if it tasted better?  What can we do to make it taste better?", 9.09, 8],
    ["The team is trying to help the villagers feel 
      better and find ways to increase boiled water usage.  
      How do you feel about the team being in your village?", 9.09, 9],
    ["We need this to work and we want to do it quickly.  
     What do you think would help the partnership between the villagers and the team?", 9.09, 10],
    
    ["Hello", 0, 11],
    ["How are you?", 0, 12],
    ["What's up ?", 0, 13],
]

#format [Question, points, response_array_index]
groupBNegativeQuestions = [
    ["Do you get your water from that dirty hole in the ground?", -10, 0],
    ["Why would you not just go get your water from the clean well?", -10, 1],
    ["Wouldn't the spring water be a better choice then?", -10, 2],
    ["Do you find that your sick often drinking the dirty irrigation water?", -10, 3],
    ["Do most people have diarrhea then?", -10, 4],
    ["Villager C boils their water and doesn't get sick, why don't you do like them?", -10, 5],
    ["What aren't you boiling your water like you were told?", -10, 6],
    ["How about drinking the boiled water with flavor?", -10, 7],
    ["What about the team trying to help you?", -10, 8],
    ["How can everyone just work together?", -10, 9],
]

groupBResponses = [ #format [Response, points, group_standing_threshold]
    [["I usually collect it from the nearby irrigation ditch.", 4.5, 80],
    ["I get my water nearby, the spring is too far.", 1, 50],
    ["From the irrigation ditch, who has time for anything else? Stop wasting my time.", -4.5, 0]],
    
    [["I would, but it has a weird taste to me.", 4.5, 80],
    ["It doesn't taste right to me.", 1, 50],
    ["That dirt inspector's well has a funny taste.  I bet they did something to it.", -4.5, 0]],
    
    [["The spring is very far away. After a long day of working in the fields I don't want to walk that far for water.", 4.5, 80],
    ["It's too far for me.", 1, 50],
    ["What? And walk all that way!? Who has time for that after a long day of work in the fields.  
    You don't work in the fields, why don't you go get it for me?", -4.5, 0]],
    
    [["I don't feel very good.  I feel very hot and I have to use the bathroom a lot.", 4.5, 80],
    ["I am very sick now. The visiting doctors say I have a fever, a bad sinus infection, and diarrhea.", 1, 50],
    ["I don't have to tell you how I feel.  You no doctor.", -4.5, 0]],
    
    [["Yes, diarrhea is part of normal life.  Many people I know have diarrhea.", 4.5, 80],
    ["Yea, most people have diarrhea.", 1, 50],
    ["You should probably ask them dirt inspector.", -4.5, 0]],
    
    [["We don't need cooked water when we aren't hot.  We need cold things when we feel good.  Cooked water wouldn't be good then.", 4.5, 80],
    ["", 0, 0],
    ["", 0, 0]],
    
    [["I guess they might not be sick because they boil their water.  
    I'm not sure where they find the time to collect wood.  Maybe they are used to the taste.", 4.5, 80],
    ["Those newcomers are a little odd.  They don't seem to understand our ways.  I'm not sure why they aren't getting sick.", 1, 50],
    ["The newcomers are very strange and do not follow our traditions. They don't even speak or dress like us. Maybe they are why our people get sick.", -4.5, 0]],
    
    [["Boiled water taste bad and I have to collect fire wood to boil it. 
    I am not often sick so there's no reason to go through the effort of always boiling my water.", 4.5, 80],
    ["It tastes bad and takes too much time.", 1, 50],
    ["Blech! That stuff is disgusting, who would drink that?  
    I don't have the time to collect firewood for something that tastes terrible.  
    If your feeling bad then you might, but I'm usually fine.", -4.5, 0]],
    
    [["Yes, if I had some herbs, lemon, or maybe cinnamon the water would be acceptable.", 4.5, 80],
    ["Maybe if there was a way to flavor it.", 1, 50],
    ["Maybe, but I still don't want to spend the time collecting firewood.", -4.5, 0]],
    
    [["I know they are trying to help, but they need to listen to our culture too.  They have a long way to go.", 4.5, 80],
    ["The team means well, but they don't understand our culture.  I'm not sure what they are going to do.", 1, 50],
    ["The dirt inspectors should leave the village. They don't respect our ways.", -4.5, 0]],
    
    [["The team needs to meet the villagers and understand their culture.  They can't just tell us what to do, they need to understand our point of view too.", 4.5, 80],
    ["I'm not sure how to get everyone to work together.  Good luck with that.", 1, 50],
    ["We can't work together.  There's no point to your team being here.  We didn't ask for your help.", -4.5, 0]],
    
    
    [["Well than if it isn't the government people.", 0, 0]],
    
    [["Yea Yea I am alright", 0, 0]],
    
    [["Nothing much", 0, 0]],
]

#format [Question, points, response_array_index]
groupCPositiveQuestions = [
    ["Where do you get your water?", 12.5, 0],
    ["There was a well put in nearby, why don't you get your water from the well?", 12.5, 1],
    ["Why don't you get your water from the spring?", 12.5, 2],
    ["How do you feel drinking the irrigaton water?", 12.5, 3],
    ["You boil your water, what made you decide to do that? Screen reader support enabled.", 12.5, 4],
    ["Why do you think we tell you to boil your water?", 12.5, 5],
    ["How do you feel about the team being in your village?", 12.5, 6],
    ["Could you help us get the other villagers to boil their water?", 12.5, 7],
    ["Hello", 0, 8],
    ["How are you?", 0, 9],
    ["What's up ?", 0, 10],
]

#format [Question, points, response_array_index]
groupCNegativeQuestions = [
    ["Do you get your water from that dirty hole in the ground?", -15, 0],
    ["Why would you not just go get your water from the clean well?", -15, 1],
    ["Wouldn't the spring water be a better choice then?", -15, 2],
    ["Do you find that your sick often drinking the dirty irrigation water?", -15, 3]
]

groupCResponses = [ #format [Response, points, group_standing_threshold]
    [["I usually collect it from the nearby irrigation ditch.", 4.5, 80],
    ["I get my water nearby, the spring is too far.", 1, 50],
    ["From the irrigation ditch, who has time for anything else? Stop wasting my time.", -4.5, 0]],
    
    [["I would, but it has a weird taste to me.", 4.5, 80], 
    ["It doesn't taste right to me.", 1, 50],
    ["That dirt inspector's well has a funny taste.  I wonder if something happened to it.", -4.5, 0]],
    
    [["The spring is very far away. After a long day of working in the fields I don't want to walk that far for water.", 4.5, 80],
    ["It's too far for me.", 1, 50],
    ["What? And walk all that way!? Who has time for that after a long day of work in the fields. 
    You don't work in the fields, why don't you go get it for me?", -4.5, 0]],
    
    [["I'm never sick from the water, but I boil the water as the team says.  It takes more time, but it's worth it for my family to be healthy.", 4.5, 80],
    ["I don't mind it.  I boil the irrigation water so it's fine.", 1, 50], 
    ["Fine.", -4.5, 0]],
    
    [["I boil my water because the Project team said that it would keep me healthy.  
    I'm really worried about these lowland diseases.  We didn't have them in my old village.  
    We boiled our water in my old village so maybe the team is right. I'll do whatever I need to keep my family safe.", 4.5, 80],
    ["You guys said to do it, so I did it.", 1, 50],
    ["I do it, because I have always done it in my old village.  These lowland people just want to get diseases.", -4.5, 0]],
    
    [["Honestly, I don't know.  Clearly something is wrong with it and you tell us it has germs. 
    But I don't see the problem.  How can water have germs if the first don't get sick?", 4.5, 80],
    ["Something about germs, I don't really get it.", 1, 50],
    ["I don't know, I just do what you say.", -4.5, 0]],
    
    [["I am grateful to have them teach me how to survive the disease infesting the lowlands.
    I was so worried about the lowland diseases, but you guys are helping. I hope everyone else will listen to you.", 4.5, 80],
    ["If they're helping I don't mind.  It can't hurt to have them here.", 1, 50],
    ["I don't think they're going to be any help.  I don't think outsiders should be interfering with our village.  We can figure things out for ourselves.", -4.5, 0]],
    
    [["I would love to, but they don't really like me. 
    I'm different than them and that's fine, but they aren't going to listen to me.", 4.5, 80],
    ["Probably not, they don't like me.", 1, 50],
    ["These people will never listen to me.  They just don't get that it's their water.  No one ever listens.", -4.5, 0]],
    
    [["Welcome we were waiting for you.", 0, 0]],
    
    [["Don't have diarrhea", 0, 0]],
    
    [["Just a working day.", 0, 0]],
    
    
]


def seed_group_data(group_id, groupQuestions, groupResponses)
    groupQuestions.each do |question_arr|
        question_string = question_arr[0]
        question_points = question_arr[1]
        responses_index = question_arr[2]
        responses = groupResponses[responses_index]
        
        question_obj = PossibleQuestion.create!(
            question: question_string,
            points: question_points,
        )
        
        responses.each do |response_arr|
            response_string = response_arr[0]
            response_points = response_arr[1]
            response_threshold = response_arr[2]
            
            if response_string != ""
                response_obj = PossibleResponse.create!(
                    response: response_string,
                    points: response_points,
                    group_standing_threshold: response_threshold
                )
                
                PossibleQuestionsResponse.create!(
                    possible_question_id: question_obj.id,
                    possible_response_id: response_obj.id
                )
            end
        end
        
        GroupsPossibleQuestion.create!(
            group_id: group_id,
            possible_question_id: question_obj.id
        )
    end
end

seed_group_data(groupA.id, groupAPositiveQuestions, groupAResponses)
seed_group_data(groupA.id, groupANegativeQuestions, groupAResponses)
seed_group_data(groupB.id, groupBPositiveQuestions, groupBResponses)
seed_group_data(groupB.id, groupBNegativeQuestions, groupBResponses)
seed_group_data(groupC.id, groupCPositiveQuestions, groupCResponses)
seed_group_data(groupC.id, groupCNegativeQuestions, groupCResponses)

##insert data produced by python code to the database 
def seed_group_data_from_file(file_name, group_id)
    
    File.foreach(file_name) { |line| 
        question_string = line.split("=>").first
        p question_string
        response_string = line.split("=>").last
        p response_string
        question_obj = PossibleQuestion.create!(
            question: question_string,
            points: 10
        )
        response_obj = PossibleResponse.create!(
                    response: response_string,
                    points: 0,
                    group_standing_threshold: 0
                )
        PossibleQuestionsResponse.create!(
                    possible_question_id: question_obj.id,
                    possible_response_id: response_obj.id
                )
        GroupsPossibleQuestion.create!(
            group_id: group_id,
            possible_question_id: question_obj.id
        )
    }
end

seed_group_data_from_file("groupA.txt", groupA.id)
seed_group_data_from_file("groupB.txt", groupB.id)
seed_group_data_from_file("groupC.txt", groupC.id)
seed_group_data_from_file("groupD.txt", groupD.id)


p "DB Seeded succesfully"