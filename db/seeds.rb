# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tag.delete_all
# Post.delete_all

t1 = Tag.create(tag: "depression")
t4 = Tag.create(tag: "mental illness")
t3 = Tag.create(tag: "stress")
t2 = Tag.create(tag: "schizophrenia")

t11 = Tag.create(tag: "illness")
t12 = Tag.create(tag: "hospital")
t13 = Tag.create(tag: "therapy")
t14 = Tag.create(tag: "HIV")
t15 = Tag.create(tag: "cancer")

t16 = Tag.create(tag: "heartbreak")
t17 = Tag.create(tag: "relationships")
t18 = Tag.create(tag: "sex")
t19 = Tag.create(tag: "breakup")
t20 = Tag.create(tag: "love")

t5 = Tag.create(tag: "drugs")
t6 = Tag.create(tag: "addiction")
t7 = Tag.create(tag: "heroin")
t8 = Tag.create(tag: "alcohol")
t9 = Tag.create(tag: "cocaine")
t10 = Tag.create(tag: "painkillers")

t21 = Tag.create(tag: "money")
t22 = Tag.create(tag: "poverty")
t23 = Tag.create(tag: "gambling")

t24 = Tag.create(tag: "violence")
t25 = Tag.create(tag: "trapped")
t26 = Tag.create(tag: "college")
t27 = Tag.create(tag: "high school")
t28 = Tag.create(tag: "family")
t29 = Tag.create(tag: "suicide")
t30 = Tag.create(tag: "death")
t31 = Tag.create(tag: "hope")
t32 = Tag.create(tag: "loss")

# p1 = Post.create(text: "The most extraordinary thing to my mind, of all the strange and wonderful things that happened upon that Friday, was the dovetailing of the commonplace habits of our social order with the first beginnings of the series of events that was to topple that social order headlong. If on Friday night you had taken a pair of compasses and drawn a circle with a radius of five miles round the Woking sand pits, I doubt if you would have had one human being outside it, unless it were some relation of Stent or of the three or four cyclists or London people lying dead on the common, whose emotions or habits were at all affected by the new-comers. Many people had heard of the cylinder, of course, and talked about it in their leisure, but it certainly did not make the sensation that an ultimatum to Germany would have done.",
#   latitude: 40.7047738,
#   longitude: -73.9418603)
# p1.tags << t3 << t12 << t15
# p1.save

# p2 = Post.create(text: "The intense excitement of the events had no doubt left my perceptive powers in a state of erethism. I remember that dinner table with extraordinary vividness even now. My dear wife's sweet anxious face peering at me from under the pink lamp shade, the white cloth with its silver and glass table furniture--for in those days even philosophical writers had many little luxuries--the crimson-purple wine in my glass, are photographically distinct. At the end of it I sat, tempering nuts with a cigarette, regretting Ogilvy's rashness, and denouncing the shortsighted timidity of the Martians.",
#   latitude: 41.23,
#   longitude: -74.12)
# p2.tags << t1 << t7 << t10
# p2.save

# p3 = Post.create(text: "Sorrowfully Dorothy left the Throne Room and went back where the Lion and the Scarecrow and the Tin Woodman were waiting to hear what Oz had said to her. 'There is no hope for me,' she said sadly, 'for Oz will not send me home until I have killed the Wicked Witch of the West; and that I can never do.'",
#   latitude: 40.78,
#   longitude: -73.56)
# p3.tags << t4 << t11 << t17
# p3.save

# p4 = Post.create(text: "I am having a hard time. My life is terrible.",
#   latitude: 51.78,
#   longitude: -90.56)
# p4.tags << t5 << t32 << t31
# p4.save




