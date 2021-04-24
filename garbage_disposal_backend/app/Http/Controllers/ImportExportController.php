<?php

namespace App\Http\Controllers;

use App\Imports\UserRoleImport;
use Illuminate\Http\Request;
use App\Imports\UsersImport;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\UsersExport;
use Symfony\Component\HttpFoundation\Response;

class ImportExportController extends Controller
{
    public function exportUsersCollection() {
//        \Spatie\DbDumper\Databases\MySql::create()
//            ->setDbName(env('DB_DATABASE'))
//            ->setUserName(env('DB_USERNAME'))
//            ->setPassword(env('DB_PASSWORD'))
//            ->dumpToFile('dump.sql');

        return Excel::download(new UsersExport, 'users-collection.xlsx');
    }

    public function importUsersCollection(Request $request) {
//        return response([$request->file('file'), 'asdasd'], 200);
        Excel::import(new UsersImport,$request->file('file'));
//        Excel::import(new UserRoleImport,request()->file('file'));
    }
}
