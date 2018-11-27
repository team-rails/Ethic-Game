# Water boiling seeds test sceneario database
# In the future users should have the means to fill this database themselves to create custom scenerios

# Create the sceneraio
desc = 'You are a member of a team of public relations officers assigned to a project. This project is a joint alliance between the US and Peruvian governments. Your role on this project tea is to provide public updates on this hight profile project --- a project that is costing the US and Peruvian governments LOTS of money.'
scenario = Scenario.create!(
    title: 'Water Boiling',
    description: desc,
    created_by: 'me'
    )
    
Scenario.create!(
    title: 'Test Scenario',
    description: 'Description',
    created_by: 'me'
    )

# Create the groups
groupA = Group.create!(
    name: 'Village Group A', 
    population_percentage: 80,
    scenario_id: scenario.id
)

groupB = Group.create!(
    name: 'Village Group B',
    population_percentage: 15,
    scenario_id: scenario.id
)

groupC = Group.create!(
    name: 'Village Group C', 
    population_percentage: 5,
    scenario_id: scenario.id
)


#format [Question, points, response_array_index]
groupAPositiveQuestions  = [
    ["Where do you get your water?", 0, 0],
    ["There was a well put in close by, why don't you get your water from the well?", 0, 1],
    ["Why don't you get your water from the spring? It's natural and clean.", 0, 2],
    ["How do you feel drinking the irrigaton water?", groupA.id, 0, 3],
    ["Do you think that others are feeling sick as well?  Are your friends and family experiencing diarrhea?", 0, 4],
    ["Boiled water is good even when you aren't sick. Could you boil your water all the time?", 0, 5],
    ["The team has explained that the water has germs. 
        If you boiled your water all the time you would not get 
        sick over and over again. What do you think about those 
        who do boil their water and aren't sick?", 0, 6],
    ["Would you drink the boiled water if it tasted better?  What can we do to make it taste better?", 0, 7],
    ["The team is trying to help the villagers feel better and 
        find ways to increase boiled water usage.  
        How do you feel about the team being in your village?", 0, 8],
    ["We need this to work and we want to do it quickly.  
      What do you think would help the partnership between the villagers and the team?", 0, 9],
]

#format [Question, points, response_array_index]
groupANegativeQuestions = [
    ["Do you get your water from that dirty hole in the ground?", 0, 0],
    ["Why would you not just go get your water from the clean well?", 0, 1],
    ["Wouldn't the spring water be a better choice then?", 0, 2],
    ["Do you find that your sick often drinking the dirty irrigation water?", 0, 3],
    ["Do most people have diarrhea then?", 0, 4],
    ["If you feel better after boiling water, 
        why wouldn't you just boil your water all the time like you were told?", 0, 5],
    ["We have told you there are germs in the irrigation ditch.  
        Villager C boils their water and doesn't get sick, why don't you do like them?", 0, 6],
    ["How about drinking the boiled water with flavor?", 0, 7],
    ["What about the team trying to help you?", 0, 8],
    ["How can everyone just work together?", 0, 9]
]

groupAResponses = [ #format [Response, points, group_standing_threshold]
    [["I usually collect it from the nearby irrigation ditch. I like how its water tastes.", 0, 0],
    ["From the ditch, it has a good taste.", 0, 0], 
    ["From the irrigation ditch, who has time for anything else? Stop wasting my time.", 0, 0]],
    
    [["I would, but it has a weird taste to me.  The irrigation water tastes better.", 0, 0], 
    ["It doesn't taste right to me.", 0, 0], 
    ["That dirt inspector's well has a funny taste.  I bet they did something to it.", 0, 0]],
    
    [["The spring is very far away. After a long day of working in the fields I'm too tired to walk that far.", 0, 0], 
    ["It's too far for me.", 0, 0], 
    ["What? And walk all that way!? Who has time for that after a long day of work in the fields.  You don't work in the fields, why don't you go get it for me?", 0, 0]],
    
    [["Right now, I don't feel very good.  I feel very hot and I have diarrhea.  
        I'm not sure it's the water though.  Sometimes I'm fine and other times I'm sick.", 0, 0],
    ["I am very sick now. The visiting doctors say I have a fever, a bad sinus infection, and diarrhea.  
        They say it's from the water, but I don't believe them. It'll go away.", 0, 0],
    ["I don't have to tell you how I feel.  You're not a doctor.", 0, 0]],
    
    [["Yes, diarrhea is just part of life.  Many people I know have diarrhea. We just boil our water to get the heat out and then we are fine again.", 0, 0], 
    ["Yea, most people have diarrhea.  It's life.", 0, 0], 
    ["I'm not them. You should probably ask them dirt inspector.", 0, 0]],
    
    [["We don't need cooked water when we aren't hot.  We need cold things when we feel good.  
    Cooked water wouldn't be good then.  Besides Boiled water taste bad and 
    I have to collect fire wood to boil it. I am not often sick so there's 
    no reason to go through the effort of always boiling my water.", 0, 0],
    ["Cooked water is only for the sick and its taste awful.", 0, 0], 
    ["Why would I? I'm not sick all the time. That's just taking extra time for no reason. 
        It also taste awful.  Why would I drink something that's disgusting?", 0, 0]],
    
    [["I guess they might not be sick because they boil their water, but
    I don't understand how something can hurt me in the water when the fish 
    are fine.  What are these germs that we can't even see.  I don't know, 
    I just think they're a little strange.  
    Taking extra time to do something that doesn't make any sense. ", 0, 0], 
    ["Those newcomers are a little odd.  They don't seem to understand our ways.  I'm not sure why they aren't getting sick. 
    How can it be these germs?  There's nothing to see in the water.", 0, 0], 
    ["The newcomers are very strange and do not follow our traditions. They don't even speak or 
    dress like us. Maybe they believe in these fake germs you talk about but I don't.", 0, 0]],
    
    [["Yes, if I had some herbs, lemon, or maybe cinnamon the water would be 
     acceptable to drink, but I still don't have the time to collect wood to cook it.", 0, 0],
     ["Maybe if there was a way to flavor it, but that doesn't take away the time it takes.", 0, 0],
     ["Maybe, but I still don't want to spend the time collecting firewood.", 0, 0]],
    
    [["I know they are trying to help, but they need to listen to our culture too.  
    They have a long way to go.  Their solutions take too much time 
    and for what? These germ things?  I'm sorry, but I don't really understand.", 0, 0],
    ["The team means well, but they don't understand our culture.  I'm not sure what they are going to do.", 0, 0],
    ["The dirt inspectors should leave the village. They don't respect our ways.  Who says we needed them to interfere?", 0, 0]],
    
    [["The team needs to talke to more villagers and understand their culture.  
    Maybe join in some of our work and activities? 
    They can't just tell us what to do, they need to understand our point of view too.", 0, 0],
    ["I'm not sure how to get everyone to work together.  Good luck with that.", 0, 0],
    ["We can't work together.  There's no point to your team being here.  We didn't ask for your help.", 0, 0]],
]

#format [Question, points, response_array_index]
groupBPositiveQuestions = [
    ["Where do you get your water?", 0, 0],
    ["Why don't you get your water from the well?", 0, 1],
    ["Why don't you get your water from the spring?", 0, 2],
    ["How do you feel drinking the irrigaton water?", 0, 3],
    ["Do you think that others are feeling sick?  Are your friends and family experiencing diarrhea?", 0, 4],
    ["Why don't you boil your water all of the time?", 0, 5],
    ["What do you think about those who do boil their water and aren't sick? ", 0, 6],
    ["The team has explained that the water has germs. 
        If you boiled your water all the time you would not get 
        sick over and over again.  Boiled water is good even when you aren't sick.  
        Could you boil your water all the time? ", 0, 7],
    ["Would you drink the boiled water if it tasted better?  What can we do to make it taste better?", 0, 8],
    ["The team is trying to help the villagers feel 
      better and find ways to increase boiled water usage.  
      How do you feel about the team being in your village?", 0, 9],
    ["We need this to work and we want to do it quickly.  
     What do you think would help the partnership between the villagers and the team?", 0, 10]
]

#format [Question, points, response_array_index]
groupBNegativeQuestions = [
    ["Do you get your water from that dirty hole in the ground?", 0, 0],
    ["Why would you not just go get your water from the clean well?", 0, 1],
    ["Wouldn't the spring water be a better choice then?", 0, 2],
    ["Do you find that your sick often drinking the dirty irrigation water?", 0, 3],
    ["Do most people have diarrhea then?", 0, 4],
    ["Villager C boils their water and doesn't get sick, why don't you do like them?", 0, 5],
    ["What aren't you boiling your water like you were told?", 0, 6],
    ["How about drinking the boiled water with flavor?", 0, 7],
    ["What about the team trying to help you?", 0, 8],
    ["How can everyone just work together?", 0, 9],
]

groupBResponses = [ #format [Response, points, group_standing_threshold]
    [["I usually collect it from the nearby irrigation ditch.", 0, 0],
    ["I get my water nearby, the spring is too far.", 0, 0],
    ["From the irrigation ditch, who has time for anything else? Stop wasting my time.", 0, 0]],
    
    [["I would, but it has a weird taste to me.", 0, 0],
    ["It doesn't taste right to me.", 0, 0],
    ["That dirt inspector's well has a funny taste.  I bet they did something to it.", 0, 0]],
    
    [["The spring is very far away. After a long day of working in the fields I don't want to walk that far for water.", 0, 0],
    ["It's too far for me.", 0, 0],
    ["What? And walk all that way!? Who has time for that after a long day of work in the fields.  
    You don't work in the fields, why don't you go get it for me?", 0, 0]],
    
    [["I don't feel very good.  I feel very hot and I have to use the bathroom a lot.", 0, 0],
    ["I am very sick now. The visiting doctors say I have a fever, a bad sinus infection, and diarrhea.", 0, 0],
    ["I don't have to tell you how I feel.  You no doctor.", 0, 0]],
    
    [["Yes, diarrhea is part of normal life.  Many people I know have diarrhea.", 0, 0],
    ["Yea, most people have diarrhea.", 0, 0],
    ["You should probably ask them dirt inspector.", 0, 0]],
    
    [["We don't need cooked water when we aren't hot.  We need cold things when we feel good.  Cooked water wouldn't be good then.", 0, 0],
    ["", 0, 0],
    ["", 0, 0]],
    
    [["I guess they might not be sick because they boil their water.  
    I'm not sure where they find the time to collect wood.  Maybe they are used to the taste.", 0, 0],
    ["Those newcomers are a little odd.  They don't seem to understand our ways.  I'm not sure why they aren't getting sick.", 0, 0],
    ["The newcomers are very strange and do not follow our traditions. They don't even speak or dress like us. Maybe they are why our people get sick.", 0, 0]],
    
    [["Boiled water taste bad and I have to collect fire wood to boil it. 
    I am not often sick so there's no reason to go through the effort of always boiling my water.", 0, 0],
    ["It tastes bad and takes too much time.", 0, 0],
    ["Blech! That stuff is disgusting, who would drink that?  
    I don't have the time to collect firewood for something that tastes terrible.  
    If your feeling bad then you might, but I'm usually fine.", 0, 0]],
    
    [["Yes, if I had some herbs, lemon, or maybe cinnamon the water would be acceptable.", 0, 0],
    ["Maybe if there was a way to flavor it.", 0, 0],
    ["Maybe, but I still don't want to spend the time collecting firewood.", 0, 0]],
    
    [["I know they are trying to help, but they need to listen to our culture too.  They have a long way to go.", 0, 0],
    ["The team means well, but they don't understand our culture.  I'm not sure what they are going to do.", 0, 0],
    ["The dirt inspectors should leave the village. They don't respect our ways.", 0, 0]],
    
    [["The team needs to meet the villagers and understand their culture.  They can't just tell us what to do, they need to understand our point of view too.", 0, 0],
    ["I'm not sure how to get everyone to work together.  Good luck with that.", 0, 0],
    ["We can't work together.  There's no point to your team being here.  We didn't ask for your help.", 0, 0]],
]

#format [Question, points, response_array_index]
groupCPositiveQuestions = [
    ["Where do you get your water?", 0, 0],
    ["There was a well put in nearby, why don't you get your water from the well?", 0, 1],
    ["Why don't you get your water from the spring?", 0, 2],
    ["How do you feel drinking the irrigaton water?", 0, 3],
    ["You boil your water, what made you decide to do that? Screen reader support enabled.", 0, 4],
    ["Why do you think we tell you to boil your water?", 0, 5],
    ["How do you feel about the team being in your village?", 0, 6],
    ["Could you help us get the other villagers to boil their water?", 0, 7]
]

#format [Question, points, response_array_index]
groupCNegativeQuestions = [
    ["Do you get your water from that dirty hole in the ground?", 0, 0],
    ["Why would you not just go get your water from the clean well?", 0, 1],
    ["Wouldn't the spring water be a better choice then?", 0, 2],
    ["Do you find that your sick often drinking the dirty irrigation water?", 0, 3]
]

groupCResponses = [ #format [Response, points, group_standing_threshold]
    [["I usually collect it from the nearby irrigation ditch.", 0, 0],
    ["I get my water nearby, the spring is too far.", 0, 0],
    ["From the irrigation ditch, who has time for anything else? Stop wasting my time.", 0, 0]],
    
    [["I would, but it has a weird taste to me.", 0, 0], 
    ["It doesn't taste right to me.", 0, 0],
    ["That dirt inspector's well has a funny taste.  I wonder if something happened to it.", 0, 0]],
    
    [["The spring is very far away. After a long day of working in the fields I don't want to walk that far for water.", 0, 0],
    ["It's too far for me.", 0, 0],
    ["What? And walk all that way!? Who has time for that after a long day of work in the fields. 
    You don't work in the fields, why don't you go get it for me?", 0, 0]],
    
    [["I'm never sick from the water, but I boil the water as the team says.  It takes more time, but it's worth it for my family to be healthy.", 0, 0],
    ["I don't mind it.  I boil the irrigation water so it's fine.", 0, 0], 
    ["Fine.", 0, 0]],
    
    [["I boil my water because the Project team said that it would keep me healthy.  
    I'm really worried about these lowland diseases.  We didn't have them in my old village.  
    We boiled our water in my old village so maybe the team is right. I'll do whatever I need to keep my family safe.", 0, 0],
    ["You guys said to do it, so I did it.", 0, 0],
    ["I do it, because I have always done it in my old village.  These lowland people just want to get diseases.", 0, 0]],
    
    [["Honestly, I don't know.  Clearly something is wrong with it and you tell us it has germs. 
    But I don't see the problem.  How can water have germs if the first don't get sick?", 0, 0],
    ["Something about germs, I don't really get it.", 0, 0],
    ["I don't know, I just do what you say.", 0, 0]],
    
    [["I am grateful to have them teach me how to survive the disease infesting the lowlands.
    I was so worried about the lowland diseases, but you guys are helping. I hope everyone else will listen to you.", 0, 0],
    ["If they're helping I don't mind.  It can't hurt to have them here.", 0, 0],
    ["I don't think they're going to be any help.  I don't think outsiders should be interfering with our village.  We can figure things out for ourselves.", 0, 0]],
    
    [["I would love to, but they don't really like me. 
    I'm different than them and that's fine, but they aren't going to listen to me.", 0, 0],
    ["Probably not, they don't like me.", 0, 0],
    ["These people will never listen to me.  They just don't get that it's their water.  No one ever listens.", 0, 0]]
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


p "DB Seeded succesfully"