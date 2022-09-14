
const domain="http://127.0.0.1:8000"; 


// Javascript Register Account 
let formdata = new FormData();
formdata.set('username' , 'Faiez Waseem')
formdata.set('email' , 'fazufaiez@gmail.com')  // can be null
formdata.set('password' , '777faiez777')
formdata.set('phoneNo' , '+923001234567') 
formdata.set('avatar' , 'https://randomuser.me/api/user/portraits/thumb/women/91.jpg')  // can be null
formdata.set('phoneNoVerfication' , 'false')
fetch(domain+"/api/user/register", {
  method: 'POST',
  body: formdata,
}).then((response) =>  response.json()).then(res => console.log(res))


// Javascript Login Account 
//let formdata = new FormData();
formdata.set('phoneNo' , 'fazufaiez@gmail.com')
formdata.set('password' , '777faiez777')
fetch(domain+"/api/user/login", {
  method: 'POST',
  body: formdata,
}).then((response) =>  response.json()).then(res => console.log(res))


// Javascript User Logout
//const token = "5|5KMLfBSnKkO3y8RmwNmHq046Z8FXirz7hTPpEVxB"
fetch(domain+"/api/logout", {
  method: 'POST',
  headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))



// Javascript user profile update
//let formdata = new FormData();
formdata.set('username' , 'Faiez Waseem') // 1 of these or all of them can be updated as same time
formdata.set('email' , 'fazufaiez@gmail.com')  
formdata.set('avatar' , 'https://randomuser.me/api/user/portraits/thumb/women/91.jpg')  
formdata.set('phoneNoVerfication' , 'false')
fetch(domain+"/api/user/update", {
  method: 'POST',
  body: formdata,
}).then((response) =>  response.json()).then(res => console.log(res))



// Javascript get User Profile Details
const token = "6|k6UmAOFgprdvbW8grpby1BtBfQE06Dr4CHGOkrfF"
fetch(domain+"/api/user", {
  method: 'GET',
  headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))


// Javascript user token create
//let formdata = new FormData();
formdata.set('token' , 'Some token') 
fetch(domain+"/api/user/token/create", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))

// Javascript user token update
//let formdata = new FormData();
formdata.set('token' , 'Some token') 
fetch(domain+"/api/user/token/update", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))


// Javascript user token delete
//let formdata = new FormData();
fetch(domain+"/api/user/token/destroy", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))


// Javascript user IP save
//let formdata = new FormData();
fetch(domain+"/api/user/ip/save", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))



// Javascript user address create
//let formdata = new FormData();
formdata.set('address' , 'Some address') 
formdata.set('alias' , 'Some address') // optional parameter
formdata.set('longitude' , 'Some address') // optional parameter
formdata.set('latitude' , 'Some address') // optional parameter
formdata.set('city' , 'Some address') // optional parameter
fetch(domain+"/api/user/address/save", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))



// Javascript user address update
//let formdata = new FormData();
formdata.set('address' , 'Some address') // optional parameter 
formdata.set('alias' , 'Some address') // optional parameter
formdata.set('longitude' , 'Some address') // optional parameter
formdata.set('latitude' , 'Some address') // optional parameter
formdata.set('city' , 'Some address') // optional parameter
formdata.set('id' , 'Some id') // optional parameter
fetch(domain+"/api/user/address/update", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))



// Javascript user address delete
//let formdata = new FormData();
formdata.set('id' , 'Some id') // optional parameter if provided delte one record else delete all record
fetch(domain+"/api/user/address/destroy", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))




// Javascript user address 
fetch(domain+"/api/user/address", {
  method: 'POST',
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))



// Javascript user address delete
//let formdata = new FormData();
fetch(domain+"/api/user/vehicle", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))




// Javascript user vehicle save
//let formdata = new FormData();
formdata.set('type' , 'Some address') 
formdata.set('no' , 'Some address') 
formdata.set('color' , 'Some address') 
formdata.set('image' , 'Some address') 
formdata.set('model' , 'Some address') 
fetch(domain+"/api/user/vehicle/save", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))



// Javascript user vehicle update
//let formdata = new FormData();
formdata.set('type' , 'Some address') 
formdata.set('no' , 'Some address') 
formdata.set('color' , 'Some address') 
formdata.set('image' , 'Some address') 
formdata.set('model' , 'Some address') 
formdata.set('id' , '1') 
fetch(domain+"/api/user/vehicle/update", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))






// Javascript user vehicle delete
//let formdata = new FormData();
formdata.set('id' , 'Some id') // optional parameter if provided delte one record else delete all record
fetch(domain+"/api/user/vehicle/destroy", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))





// Javascript user Ride created
//let formdata = new FormData();
/*
 'description' => 'required|string|max:400',
            'drop_address' => 'required|string|max:800',
            'drop_longitude' => 'string|required',
            'drop_latitude' => 'string|required',
            'drop_city' => 'string|required',
            'pick_address' => 'required|string|max:800',
            'pick_longitude' => 'string|required',
            'pick_latitude' => 'string|required',
            'pick_city' => 'string|required',
            'departure_date' => 'string|required',
            'departure_time' => 'string|required',
            'status' => 'string|required',
            'noOfSeats' => 'required',
            'fare' => 'required',
            'vehicle_id' => 'required',
*/
fetch(domain+"/api/user/ride/save", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))





// Get a Single Ride Details
const id_here = 3;
fetch(domain+`/api/ride/${id_here}`).then((response) =>  response.json()).then(res => console.log(res))




// Get all  Rides of the day
fetch(domain+`/api/rides`).then((response) =>  response.json()).then(res => console.log(res))



// Javascript user ride delete
//let formdata = new FormData();
formdata.set('id' , 'Some id') 
fetch(domain+"/api/user/ride/destroy", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))



// Javascript user send ride-request 
//let formdata = new FormData();
formdata.set('ride_id' , 'Some id'); 
formdata.set('status' , 'pending'); 
formdata.set('seats_count' , 2); 
fetch(domain+"/api/user/ride-request", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))


// Javascript rider accept ride 
//let formdata = new FormData();
formdata.set('ride_id' , 'Some id'); 
formdata.set('id' , 'Some id');   // request id
formdata.set('status' , 'pending'); 
fetch(domain+"/api/user/ride-request/accept", {
  method: 'POST',
  body: formdata,
    headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))





// Javascript user give rating
//let formdata = new FormData();
formdata.set('ride_id' , 3); 
formdata.set('rating' , );   // request id
formdata.set('status' , 'pending'); 
fetch(domain+"/api/user/ride/rating/save", {
  method: 'POST',
  body: formdata,
  headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))



// Javascript user app report
//let formdata = new FormData();
formdata.set('email' , 3); 
formdata.set('reason' , ); 
fetch(domain+"/api/user/report", {
  method: 'POST',
  body: formdata,
  headers: { Authorization: `Bearer ${token}` , 
  Accept: "application/json"
},
}).then((response) =>  response.json()).then(res => console.log(res))
