<?php

namespace udalost\backend\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;  
use udalost\backend\models\Commentaire as Commentaire;

class Participant extends Model {
  protected $table = 'participant';
  protected $primaryKey = 'id';

	public function commentaires() {
    	return $this->HasMany('Commentaire', 'id_participant');
    }
}
