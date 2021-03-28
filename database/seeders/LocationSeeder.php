<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LocationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('locations')->insert([
            'HANOI' => [
                'name' => 'Hà Nội',
                'area_type' => AREA_NORTHERN,
            ],
            'HOCHIMINH' => [
                'name' => 'Hồ Chí Minh',
                'area_type' => AREA_SOUTH,
            ],
            'HAIPHONG' => [
                'name' => 'Hải Phòng',
                'area_type' => AREA_NORTHERN,
            ],
            'DANANG' => [
                'name' => 'Đà Nẵng',
                'area_type' => AREA_CENTRAL,
            ],
            'HAGIANG' => [
                'name' => 'Hà Giang',
                'area_type' => AREA_NORTHERN,
            ],
            'CAOBANG' => [
                'name' => 'Cao Bằng',
                'area_type' => AREA_NORTHERN,
            ],
            'LAICHAU' => [
                'name' => 'Lai Châu',
                'area_type' => AREA_NORTHERN,
            ],
            'LAOCAI' => [
                'name' => 'Lào Cai',
                'area_type' => AREA_NORTHERN,
            ],
            'TUYENQUANG' => [
                'name' => 'Tuyên Quang',
                'area_type' => AREA_NORTHERN,
            ],
            'LANGSON' => [
                'name' => 'Lạng Sơn',
                'area_type' => AREA_NORTHERN,
            ],
            'BACKAN' => [
                'name' => 'Bắc Kạn',
                'area_type' => AREA_NORTHERN,
            ],
            'THAINGUYEN' => [
                'name' => 'Thái Nguyên',
                'area_type' => AREA_NORTHERN,
            ],
            'YENBAI' => [
                'name' => 'Yên Bái',
                'area_type' => AREA_NORTHERN,
            ],
            'SONLA' => [
                'name' => 'Sơn La',
                'area_type' => AREA_NORTHERN,
            ],
            'PHUTHO' => [
                'name' => 'Phú Thọ',
                'area_type' => AREA_NORTHERN,
            ],
            'VINHPHUC' => [
                'name' => 'Vĩnh Phúc',
                'area_type' => AREA_NORTHERN,
            ],
            'QUANGNINH' => [
                'name' => 'Quảng Ninh',
                'area_type' => AREA_NORTHERN,
            ],
            'BACGIANG' => [
                'name' => 'Bắc Giang',
                'area_type' => AREA_NORTHERN,
            ],
            'BACNINH' => [
                'name' => 'Bắc Ninh',
                'area_type' => AREA_NORTHERN,
            ],
            'HAIDUONG' => [
                'name' => 'Hải Dương',
                'area_type' => AREA_NORTHERN,
            ],
            'HUNGYEN' => [
                'name' => 'Hưng Yên',
                'area_type' => AREA_NORTHERN,
            ],
            'HOABINH' => [
                'name' => 'Hòa Bình',
                'area_type' => AREA_NORTHERN,
            ],
            'HANAM' => [
                'name' => 'TỈNH HÀ NAM',
                'area_type' => AREA_NORTHERN,
            ],
            'NAMDINH' => [
                'name' => 'Nam Định',
                'area_type' => AREA_NORTHERN,
            ],
            'THAIBINH' => [
                'name' => 'Thái Bình',
                'area_type' => AREA_NORTHERN,
            ],
            'NINHBINH' => [
                'name' => 'Ninh Bình',
                'area_type' => AREA_NORTHERN,
            ],
            'THANHHOA' => [
                'name' => 'Thanh Hóa',
                'area_type' => AREA_CENTRAL,
            ],
            'NGHEAN' => [
                'name' => 'Nghệ An',
                'area_type' => AREA_CENTRAL,
            ],
            'HATINH' => [
                'name' => 'Hà Tĩnh',
                'area_type' => AREA_CENTRAL,
            ],
            'QUANGBINH' => [
                'name' => 'Quảng Bình',
                'area_type' => AREA_CENTRAL,
            ],
            'QUANGTRI' => [
                'name' => 'Quảng Trị',
                'area_type' => AREA_CENTRAL,
            ],
            'THUATHIENHUE' => [
                'name' => 'Thừa Thiên Huế',
                'area_type' => AREA_CENTRAL,
            ],
            'QUANGNAM' => [
                'name' => 'Quảng Nam',
                'area_type' => AREA_CENTRAL,
            ],
            'QUANGNGAI' => [
                'name' => 'Quảng Ngãi',
                'area_type' => AREA_CENTRAL,
            ],
            'KONTUM' => [
                'name' => 'Kon Tum',
                'area_type' => AREA_CENTRAL,
            ],
            'BINHDINH' => [
                'name' => 'Bình Định',
                'area_type' => AREA_CENTRAL,
            ],
            'GIALAI' => [
                'name' => 'Gia Lai',
                'area_type' => AREA_CENTRAL,
            ],
            'PHUYEN' => [
                'name' => 'Phú Yên',
                'area_type' => AREA_CENTRAL,
            ],
            'DAKLAK' => [
                'name' => 'Đăk Lăk',
                'area_type' => AREA_CENTRAL,
            ],
            'KHANHHOA' => [
                'name' => 'Khánh Hòa',
                'area_type' => AREA_CENTRAL,
            ],
            'LAMDONG' => [
                'name' => 'Lâm Đồng',
                'area_type' => AREA_CENTRAL,
            ],
            'BINHPHUOC' => [
                'name' => 'Bình Phước',
                'area_type' => AREA_SOUTH,
            ],
            'BINHDUONG' => [
                'name' => 'Bình Dương',
                'area_type' => AREA_SOUTH,
            ],
            'NINHTHUAN' => [
                'name' => 'Ninh Thuận',
                'area_type' => AREA_CENTRAL,
            ],
            'TAYNINH' => [
                'name' => 'Tây Ninh',
                'area_type' => AREA_SOUTH,
            ],
            'BINHTHUAN' => [
                'name' => 'Bình Thuận',
                'area_type' => AREA_CENTRAL,
            ],
            'DONGNAI' => [
                'name' => 'Đồng Nai',
                'area_type' => AREA_SOUTH,
            ],
            'LONGAN' => [
                'name' => 'Long An',
                'area_type' => AREA_SOUTH,
            ],
            'DONGTHAP' => [
                'name' => 'Đồng Tháp',
                'area_type' => AREA_SOUTH,
            ],
            'ANGIANG' => [
                'name' => 'An Giang',
                'area_type' => AREA_SOUTH,
            ],
            'BARIAVUNGTAU' => [
                'name' => 'Bà Rịa Vũng Tàu',
                'area_type' => AREA_SOUTH,
            ],
            'TIENGIANG' => [
                'name' => 'Tiền Giang',
                'area_type' => AREA_SOUTH,
            ],
            'KIENGIANG' => [
                'name' => 'Kiên Giang',
                'area_type' => AREA_SOUTH,
            ],
            'TRAVINH' => [
                'name' => 'Trà Vinh',
                'area_type' => AREA_SOUTH,
            ],
            'BENTRE' => [
                'name' => 'Bến Tre',
                'area_type' => AREA_SOUTH,
            ],
            'VINHLONG' => [
                'name' => 'Vĩnh Long',
                'area_type' => AREA_SOUTH,
            ],
            'SOCTRANG' => [
                'name' => 'Sóc Trăng',
                'area_type' => AREA_SOUTH,
            ],
            'BACLIEU' => [
                'name' => 'Bạc Liêu',
                'area_type' => AREA_SOUTH,
            ],
            'CAMAU' => [
                'name' => 'Cà Mau',
                'area_type' => AREA_SOUTH,
            ],
            'DIENBIEN' => [
                'name' => 'Điện Biên',
                'area_type' => AREA_NORTHERN,
            ],
            'DAKNONG' => [
                'name' => 'Đắk Nông',
                'area_type' => AREA_CENTRAL,
            ],
            'HAUGIANG' => [
                'name' => 'Hậu Giang',
                'area_type' => AREA_SOUTH,
            ],
            'CANTHO' => [
                'name' => 'Cần Thơ',
                'area_type' => AREA_SOUTH,
            ]
        ]);
    }
}
