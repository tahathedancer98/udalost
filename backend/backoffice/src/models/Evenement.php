<?php

namespace udalost\backend\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;  
use udalost\backend\models\Utilisateur as Utilisateur;

class Utilisateur extends Model {
  protected $table = 'evenement';
  protected $primaryKey = 'id';

  	public function utilisateurs() {
		return $this->belongsToMany('Utilisateur',
	           						'participant',
	           						'id_evenement',
	        						'id_utilisateur')
					->withPivot(['id','nom','status','message','id_utilisateur','id_evenement']);
	}
} 