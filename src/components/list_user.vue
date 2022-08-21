<template>
  <v-data-table
    :headers="headers"
    :items="desserts"
    sort-by="calories"
    class="elevation-1"
  >
    <template v-slot:top>
      <v-toolbar
        flat
      >
        <v-toolbar-title>My CRUD</v-toolbar-title>
        <v-divider
          class="mx-4"
          inset
          vertical
        ></v-divider>
        <v-spacer></v-spacer>
        <v-dialog
          v-model="dialog"
          max-width="500px"
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              color="primary"
              dark
              class="mb-2"
              v-bind="attrs"
              v-on="on"
            >
              Ajouter
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.NumLivre"
                      label="NumLivre"
                    ></v-text-field>                <!--teto ko zah nanona-->
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.Titre"
                      label="Titre"
                    />                              <!--teto ko zah nanona-->
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.Auteur"
                      label="Auteur"
                    ></v-text-field>                <!--teto ko zah nanona-->
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.Date_edition"    
                      label="Date_edition"             
                    ></v-text-field>                <!--teto ko zah nanona-->
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.Disponibilité"    
                      label="Disponibilité"             
                    ></v-text-field>                <!--teto ko zah nanona-->
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.Quantité"    
                      label="Quantité"             
                    ></v-text-field>                <!--teto ko zah nanona-->
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <!-- <v-text-field
                      v-model="editedItem.protein"
                      label="Protein (g)"                 //teto novaiko
                    ></v-text-field> -->
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn
                color="blue darken-1"
                text
                @click="edit"               
              >
                Edit
              </v-btn>
              <v-btn
                color="blue darken-1"
                text
                @click="close"
              >
                Cancel
              </v-btn>
              <v-btn
                color="blue darken-1"
                text
                @click="save"               
              >
                Save
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <v-dialog v-model="dialogDelete" max-width="500px">
          <v-card>
            <v-card-title class="text-h5">Are you sure you want to delete this item?</v-card-title>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="closeDelete">Cancel</v-btn>
              <v-btn color="blue darken-1" text @click="deleteItemConfirm">OK</v-btn>
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template v-slot:[`item.actions`]="{ item }">
      <v-icon
        small
        class="mr-2"
        @click="editItem(item)"
      >
        mdi-pencil
      </v-icon>
      <v-icon
        small
        @click="deleteItem(item)"
      >
        mdi-delete
      </v-icon>
    </template>
    <template v-slot:no-data>
      <v-btn
        color="primary"
        @click="initialize"
      >
        Afficher
      </v-btn>
    </template>
  </v-data-table>
</template>

<script>
import axios from 'axios';
  export default {
    data: () => ({
      dialog: false,
      dialogDelete: false,
      headers: [
        {
          text: 'NumLivre',
          align: 'start',
          sortable: false,
          value: 'NumLivre',
        },
        
        { text: 'Titre', value: 'Titre' },
        { text: 'Auteur', value: 'Auteur' },
        { text: 'Date_edition', value: 'Date_edition' },
        { text: 'Disponibilité', value: 'Disponibilité' },
        { text: 'Quantité', value: 'Quantité' },
        { text: 'Actions', value: 'actions', sortable: false },
      ],
      desserts: [],
      editedIndex: -1,
      editedItem: {
        NumLivre: '',
        Titre: '',
        Auteur: '',
        Date_edition: '',
        Disponibilité: '',
        Quantité: '',
      },
      defaultItem: {
        NumLivre: '',
        Titre: '',
        Auteur: '',
        Date_edition: '',
        Disponibilité: '',
        Quantité: '',
      },

      
    }),

    computed: {
      formTitle () {
        return this.editedIndex === -1 ? 'New Item' : 'Edit Item'
      },
    },

    watch: {
      dialog (val) {
        val || this.close()
      },
      dialogDelete (val) {
        val || this.closeDelete()
      },
    },

    created () {
      this.initialize()
    },

    methods: {
      initialize () {
        // this.desserts = [
        //   {
        //     name: 'Frozen Yogurt',
        //     calories: 159,
        //     fat: 6.0,
        //     carbs: 24,
        //     protein: 4.0,
        //   },
          
        // ]
        //eto ny axios
      },

      editItem (item) {
        // item.preventDefault();
        this.editedIndex = this.desserts.indexOf(item)
        this.editedItem = Object.assign({}, item)
        this.dialog = true
        axios
                    .post('http://localhost/modiffierLivre.php', {
                    NumLivre: this.editedItem.NumLivre,
                    Titre: this.editedItem.Titre,
                    Auteur: this.editedItem.Auteur,
                    Date_edition: this.editedItem.Date_edition,
                    Disponibilité: this.editedItem.Disponibilité,
                    Quantité: this.editedItem.Quantité
                    })
                    .then(function (response) {
                    console.log(response);
                    })
                    .catch(function (error) {
                    console.log(error);
                    });
      },
      

      deleteItem (item) {
        this.editedIndex = this.desserts.indexOf(item)
        this.editedItem = Object.assign({}, item)
        this.dialogDelete = true
      },

      deleteItemConfirm () {
        this.desserts.splice(this.editedIndex, 1)
        this.closeDelete()
      },

      close () {
        this.dialog = false
        this.$nextTick(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        })
      },

      closeDelete () {
        this.dialogDelete = false
        this.$nextTick(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        })
      },

      save (e) {
        e.preventDefault();
        console.log("Data sended!!!");
        if (this.editedIndex > -1) {
          Object.assign(this.desserts[this.editedIndex], this.editedItem)
        } else {
          this.desserts.push(this.editedItem)
        }
        axios
                    .post('http://localhost/ajouterLivre.php', {
                    NumLivre: this.editedItem.NumLivre,
                    Titre: this.editedItem.Titre,
                    Auteur: this.editedItem.Auteur,
                    Date_edition: this.editedItem.Date_edition,
                    Disponibilité: this.editedItem.Disponibilité,
                    Quantité: this.editedItem.Quantité
                    })
                    .then(function (response) {
                    console.log(response);
                    })
                    .catch(function (error) {
                    console.log(error);
                    });
        this.close()
      },
      edit (e) {
        e.preventDefault();
        console.log("Data sended!!!");
        if (this.editedIndex > -1) {
          Object.assign(this.desserts[this.editedIndex], this.editedItem)
        } else {
          this.desserts.push(this.editedItem)
        }
        axios
                    .post('http://localhost/modiffierLivre.php', {
                    NumLivre: this.editedItem.NumLivre,
                    Titre: this.editedItem.Titre,
                    Auteur: this.editedItem.Auteur,
                    Date_edition: this.editedItem.Date_edition,
                    Disponibilité: this.editedItem.Disponibilité,
                    Quantité: this.editedItem.Quantité
                    })
                    .then(function (response) {
                    console.log(response);
                    })
                    .catch(function (error) {
                    console.log(error);
                    });
        this.close()
      },
    },
  }
</script>