<?php

namespace App\Http\Controllers;

use App\Models\app_reports;
use Illuminate\Http\Request;
use Validator;

class AppReportsController extends Controller
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
            'reason' => 'required|string|max:600',
            'email' => 'string|required',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors());       
        }
        // $request->ip()
        $record = new app_reports();
        $record->user_id = $request->user()->id;
        $record->reason = $request->reason;
        $record->ip = $request->ip();
        $record->email =  $request->email;
        $record->save();

        return response()->json([ 'status' => true , 'data' => 'Report Sent Success.']);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\app_reports  $app_reports
     * @return \Illuminate\Http\Response
     */
    public function show(app_reports $app_reports)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\app_reports  $app_reports
     * @return \Illuminate\Http\Response
     */
    public function edit(app_reports $app_reports)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\app_reports  $app_reports
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, app_reports $app_reports)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\app_reports  $app_reports
     * @return \Illuminate\Http\Response
     */
    public function destroy(app_reports $app_reports)
    {
        //
    }
}
