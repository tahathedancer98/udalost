<?php

namespace udalost\webapp\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;  

class Participant extends Model {
  protected $table = 'participant';
  protected $primaryKey = 'id';
  public $timestamps = false;

	public function commentaires() {
    return $this->hasMany('udalost\webapp\models\Commentaire', 'id_participant');
  }
}
