<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\PropertyType;
use App\Models\User;



class UserController extends Controller
{

   
    public function UserDashboard(){
        $types = PropertyType::latest()->get();
        // return view("backend.type.all_type",compact("types"));
       return view('user.index2',  compact("types"));                                                                                                 
    }

    public function UserLogout(Request $request)
    {
        Auth::guard('web')->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/admin/login');
    }

    public function UserProfile2()
    {
        $id = Auth::user()->id;
        $profileData = User::find($id);
        return view('user.user_profile_view', compact('profileData'));
    }



    
}
