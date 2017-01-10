# README

I've implemented a service for users to post requests/concerns through a chat-medium to all trainers available with the platform. It allows trainers to log in and address the issues posted by the users on to the application. 

Once a trainer responds to a user's query, it is taken off of the request board and other trainers no longer see it. (This step is subject to database writes, and the corresponding update is subject to a reload on a browser. I have not added polling methods to check the status of the request board and/or the query currently being answered; however, that would be the optimal thing to do. We could also, lock a query as soon as a trainer attempts to respond to it, and make it available for others to see if it still remains unanswered in an hour's time.)

I have assumed that trainers do not message amongst each other and are only allowed access to users through the app. The users have a limitation of one active chat and they must terminate/close the chat thread if they wish to post another query. This prevents unwanted clutter on the board.

Both, the trainer or a user can deem a chat thread complete and terminate it from their active chats screen. A trainer has multiple active chats, whereas a user can only have one. The trainer can choose which active chat to respond to by clicking on 'respond' on the row with the desired active chat in the displayed table. Once closed, the thread appears in both of their inactive chats. There isn't an admin as yet who can delete/edit messages.

Some other things that I'm still trying to implement are:
1. A search field for trainers to choose the user they want to respond to.
2. A point/talent based system for trainers that lets them choose their area of expertise so that queries are streamlined to them from the request board. The users, too, get to narrow down the audience of their request so that they have higher chances of getting satisfactory answers.
