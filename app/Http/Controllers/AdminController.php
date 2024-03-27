<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function AdminDashboard()
    {
        return view('admin.index');
    }

    public function AdminLogout(Request $request)
    {
        Auth::guard('web')->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/admin/login');
    }

    public function AdminLogin()
    {
        return view('admin.admin_login');
    }

    public function AdminProfile2()
    {
        $id = Auth::user()->id;
        $profileData = User::find($id);
        return view('admin.admin_profile_view', compact('profileData'));
    }

    public function AdminProfileStore(Request $request)
    {
        $id = Auth::user()->id;
        $data = User::find($id);
        $data->username = $request->username;
        $data->name = $request->name;
        $data->email = $request->email;
        $data->phone = $request->phone;
        $data->address = $request->address;
        
        if ($request->file('photo')) {
            $file = $request->file('photo');
            @unlink(public_path('upload/admin_images/' . $data->photo));
            $filename = date('YmdHi') . $file->getClientOriginalName();
            $file->move(public_path('upload/admin_images'), $filename);
            $data->photo = $filename;
        }
        $data->save();

        $notification = [
            'message' => 'Profil Admin berhasil diperbarui',
            'alert-type' => 'success'
        ];

        return redirect()->back()->with($notification);
    }

    public function AdminChangePassword()
    {
        $id = Auth::user()->id;
        $profileData = User::find($id);
        return view('admin.admin_change_password', compact('profileData'));
    }
    
    public function AdminUpdatePassword(Request $request)
    {
        // Validation
        $request->validate([  
            'old_password' => 'required',
            'new_password' => 'required|confirmed',
        ]);
    
        // Match Old Password
        if (!Hash::check($request->old_password, Auth::user()->password)) {
            $notification = [
                'message' => 'Password lama salah',
                'alert-type' => 'error'
            ];
            return back()->with($notification);
        }
    
        // Update new password
        User::whereId(auth()->user()->id)->update([
            'password'=> Hash::make($request->new_password)
        ]);
    
        $notification = [
            'message' => 'Password berhasil diperbarui',
            'alert-type' => 'success'
        ];
        return back()->with($notification);
    }
    
}
