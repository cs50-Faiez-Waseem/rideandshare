<?php

namespace App\Http\Controllers;

use App\Models\ride;
use App\Models\ride_request;
use App\Models\user_notification;
use Illuminate\Http\Request;
use Validator;

class RideRequestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //------------------------NOTE--------------------------
        // do not accept ride creator to request his own ride
        //------------------------NOTE--------------------------
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'seats_count' => 'integer|required',
            'status' => 'string|nullable',
            'ride_id' => 'integer|string|required',
        ]);
        if($validator->fails()){
            return response()->json(['data'=> $validator->errors(), 'status' => false]);       
        }

         $Ride = ride::findOrFail($request->input('ride_id'));


         if($Ride->user_id === $request->user()->id){
            return response()->json(['data'=> 'Ride Creator Cannot Request His Own Ride.', 'status' => false]);
         }

         $ride_requests = ride_request::where('ride_id' , '=' , $request->ride_id)->get();

         for ($i=0; $i < count($ride_requests) ; $i++) { 
             if($ride_requests[$i]->user_id == $request->user()->id){
                return response()->json(['data'=> 'Already Requested for booking.', 'status' => false]);
             }
         }
         

         $record = new ride_request();
         $record->user_id = $request->user()->id;
         $record->ride_id = $request->input('ride_id');
         $record->status = 'pending';
         if($request->has('offered_fare')){
             $record->offered_fare = $request->input('offered_fare');
         }
         $record->seats_count = $request->input('seats_count');
         $record->save();

       $noti =   new  user_notification();
       $noti->user_id = $Ride->user_id;
       $noti->message =  $request->user()->username ." Requested To Join The Ride.";
       $noti->save();

        return response()->json(['data'=> $record, 'status' => true]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ride_request  $ride_request
     * @return \Illuminate\Http\Response
     */
    public function save(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'status' => 'string|pending|accepted|canceled',
            'ride_id' => 'integer|required',
            'id' => 'integer|string|required',
        ]);

        $record = ride::where('id' ,  '=' , $request->ride_id)->first();
        $ride_requests = ride_request::where('ride_id' , '=' , $request->ride_id)->get();
        $booked = 0;
        for ($i=0; $i < count($ride_requests) ; $i++) { 
            if($ride_requests[$i]->status === 'accepted'){
                $booked += $ride_requests[$i]->seats_count;
            }
        }
        $left = $record->noOfSeats - $booked;
        if($booked == $record->noOfSeats){
            return response()->json(['data'=> 'Error Booking fulled. All Seats Are booked', 'status' => false]);       
        }else{
          if($left >= $request->input('seats_count')){
            if($record->user_id == $request->user()->id){
                $response = ride_request::where([['id', '=', $request->id]])->update(['status' =>  $request->input('status')]);
                return response()->json(['data'=> $response ? 'Updated' : 'Failed', 'status' => $response ?  true : false]);           
            }else{
                return response()->json(['data'=> 'Error Booking Failed. You do not have rights to make changes Here. ', 'status' => false]);           
            }
          }else{
            return response()->json(['data'=> 'Error Booking Failed. Only '. $left .'left', 'status' => false]);       
          }
        }
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ride_request  $ride_request
     * @return \Illuminate\Http\Response
     */
    public function edit(ride_request $ride_request)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ride_request  $ride_request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ride_request $ride_request)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ride_request  $ride_request
     * @return \Illuminate\Http\Response
     */
    public function destroy(ride_request $ride_request)
    {
        //
    }
}
