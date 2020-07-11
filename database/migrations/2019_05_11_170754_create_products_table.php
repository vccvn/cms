<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('category_id')->unsigned()->default(0);
            $table->string('name');
            $table->string('slug')->nullable();
            $table->text('description')->nullable();
            $table->text('detail')->nullable();
            $table->string('keywords')->nullable();
            $table->string('feature_image')->nullable();
            $table->string('code')->nullable();
            $table->decimal('list_price', 12, 2)->unsigned()->nullable()->default(0);
            $table->decimal('sale_price', 12, 2)->unsigned()->nullable()->default(0);
            $table->integer('on_sale')->unsigned()->nullable()->default(0);
            $table->integer('views')->default(0);
            $table->string('privacy')->default('public');
            $table->string('category_map')->nullable();
            $table->integer('status')->default(1);
            $table->integer('deleted')->default(0);
            $table->bigInteger('shop_id')->unsigned()->default(0);
           
            $table->timestamps();
            
            // $table->foreign('created_by')->references('id')->on('users')->onDelete('cascade');
            // $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
            // $table->foreign('owner_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
