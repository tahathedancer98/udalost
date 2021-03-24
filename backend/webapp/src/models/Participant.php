<?php

namespace udalost\webapp\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;  
use udalost\webapp\models\Commentaire as Commentaire;

class Participant extends Model {
  protected $table = 'participant';
  protected $primaryKey = 'id';

	public function commentaires() {
    return $this->hasMany('Commentaire', 'id_participant');
  }
}
