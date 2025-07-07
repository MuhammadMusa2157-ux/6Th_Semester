# def get_event_date(event):
#   return event.date

# def current_users(events):
#   events.sort(key=get_event_date)
#   machines={}
#   for event in events:
#     if event.machine is not None:
#        machines[event.machine]=event.user
#     if event.type=="login":
#       machines[event.machine]=event.user
#     elif event.type=="logout":
#       machines[event.machine]=None
#       return machines

# def  generate_report(machines):
#   for machine ,user in machines.items():
#     if len(user)>0:
#       print("{}:{}".formate(machine,user))
#     else:
#       print(("{}:unauthorized user").formate(machine))


names=['characters','Apna college ','data Science','Artifical Intelligence ','Cyber Security','Mechancial Engineering']
print(names)
print(sorted(names))
print(names)


# formate  in python who to user it 

names=['characters','Apna college ','data Science','Artifical Intelligence ','Cyber Security','Mechancial Engineering']
count=0
for index ,name in enumerate(names):
  print("{}:{}".formate(index,name))