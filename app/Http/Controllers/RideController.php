<?php

namespace App\Http\Controllers;

use App\Models\ride;
use App\Models\pickup_address;
use App\Models\drop_address;
use App\Models\ride_request;
use Illuminate\Http\Request;
use Validator;
use Carbon\Carbon;
class RideController extends Controller
{

    public function index()
    {
 
        $record = ride::whereDate('departure_date', '>=', Carbon::today()->toDateString())
        ->where('status' , '=' ,'pending')
        ->latest('created_at')
        ->paginate(6);
        for($i=0; $i< count($record); $i++){
            
            $drop_Record = drop_address::where('id' ,  '=' , $record[$i]->dropOff_id)->first();
            $pick_Record = pickup_address::where('id' ,  '=' , $record[$i]->pickup_id)->first();
    
            $record[$i]->pickup_address = $pick_Record;
            $record[$i]->dropoff_address = $drop_Record;
        }

    
        return response()->json(['data'=> $record, 'status' => true]);
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
        ]);
        if($validator->fails()){
            return response()->json($validator->errors());       
        }

        $user_id =$request->user()->id;

        $record1 = new pickup_address();
        $record1->address = $request->input('pick_address');
        $record1->longitude = $request->input('pick_longitude');
        $record1->latitude = $request->input('pick_latitude');
        $record1->city = $request->input('pick_city');
        $record1->save();

        $record2 = new drop_address();
        $record2->address = $request->input('drop_address');
        $record2->longitude = $request->input('drop_longitude');
        $record2->latitude = $request->input('drop_latitude');
        $record2->city = $request->input('drop_city');
        $record2->save();

        $record = new ride();
        $record->user_id = $user_id;
        $record->departure_date = $request->input('departure_date');
        $record->departure_time = $request->input('departure_time');
        $record->noOfSeats = $request->input('noOfSeats');
        $record->fare = $request->input('fare');
        $record->description = $request->input('description');
        $record->vehicle_id = $request->input('vehicle_id');
        $record->pickup_id = $record1->id;
        $record->dropOff_id = $record2->id;
        $record->status = 'pending';
        $record->save();

        $record->pickup_address = $record1;
        $record->dropoff_address = $record2;

        return response()->json(['data'=> $record, 'status' => true]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ride  $ride
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        

        $record = ride::where('id' ,  '=' , $id)->get();
        if(!empty($record[0])){
        $drop_Record = drop_address::where('id' ,  '=' , $record[0]->dropOff_id)->first();
        $pick_Record = pickup_address::where('id' ,  '=' , $record[0]->pickup_id)->first();

        $record[0]->pickup_address = $pick_Record;
        $record[0]->dropoff_address = $drop_Record;
        }
        $ride_requests = ride_request::where('ride_id' , '=' , $id)->get();
        $record[0]->request = $ride_requests;

        $booked = 0;
        for ($i=0; $i < count($ride_requests) ; $i++) { 
            if($ride_requests[$i]->status === 'accepted'){
                $booked += $ride_requests[$i]->seats_count;
            }
        }
        $record[0]->booked = $booked;
    
        return response()->json(['data'=> $record[0], 'status' => true  ]);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ride  $ride
     * @return \Illuminate\Http\Response
     */
    public function edit(ride $ride)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ride  $ride
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ride $ride)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ride  $ride
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'id' => 'required',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors());       
        }
        $response = 0;
        $current_ride = ride::findOrFail($request->id);
        if($current_ride->status === 'pending'){
          $response =  ride::where('id' , '=' , $request->id)->delete();
        }
        return response()->json(['status' => $response , 'message' => $response === 0 ? 'Cannot Delete This Ride Record . The Has Either started or finished': 'Ride Deleted successfully' ]);

    }
}
