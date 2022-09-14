<?php

namespace App\Http\Controllers;

use App\Models\ride_rating;
use App\Models\ride_request;
use Illuminate\Http\Request;
use Validator;

class RideRatingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
            'ride_id' => 'required|numeric',
            'rating' => 'required|numeric|between:0,99.99',
        ]);
        if($validator->fails()){   
            return response()->json(['data'=> $validator->errors(), 'status' => false]);  
        }
         
        // checking if user ever taken the ride 
        $RideRequest =  ride_request::where([
            ['ride_id' , '=' , $request->ride_id ],
            ['user_id' , '=' , $request->user()->id ],
            ['status' , '=' , 'accepted']
        ])->first();


        if($RideRequest){
            // checking if user have Already given the rating
           $result = ride_rating::where([
                ['ride_user_id' , '=' , $request->user()->id],
                ['ride_id' , '=' , $request->ride_id]
            ])->first();
            if(!$result){
                $record = new ride_rating();
                $record->ride_id = $request->ride_id;
                $record->ride_user_id = $request->user()->id;
                $record->rating = $request->rating;
                $record->save();
                return response()->json(['data'=> $record, 'status' => true]);
            }else{
                return response()->json(['data'=> 'Already Rated The Ride.', 'status' => true]);
            }
        }else{
            return response()->json(['data'=> "Invalid Rating Request ! , User Never took this Ride. ", 'status' => true]);
        }

       
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ride_rating  $ride_rating
     * @return \Illuminate\Http\Response
     */
    public function show(ride_rating $ride_rating)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ride_rating  $ride_rating
     * @return \Illuminate\Http\Response
     */
    public function edit(ride_rating $ride_rating)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ride_rating  $ride_rating
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ride_rating $ride_rating)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ride_rating  $ride_rating
     * @return \Illuminate\Http\Response
     */
    public function destroy(ride_rating $ride_rating)
    {
        //
    }
}
