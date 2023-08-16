<template> 
<div>
    <div class="manager-profile">
        <header class="header-container">
            <div class="title">
                <h1 class="welcome"> Welcome Paris</h1>
                <h4 class="tagline"> What would you like to do?</h4>
            </div>    
        </header>
        <main class="main-container">
            <div class="table-container">
            <table id="tblUsers" class="data-table">   
                <thead>
                    <h3> Users </h3>
                    <tr>
                        <th>username</th>
                        <th>user Id</th>
                        <th>role</th>
                        <th>actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="user in usersGetter" v-bind:key="user.userId" v-bind:user = "user">
                        <td>{{ user.username }}</td>
                        <td>{{ user.id }}</td>
                        <td v-for="authority in user.authorities" v-bind:key="authority.name">{{ authority.name }}</td>
                            <!-- <div class="button=container" v-for="authority in user.authorities" v-bind:key="authority.name">
                            <button class="toggle-role" value="Reload Page" v-on:click="setBrewer(user.id), toggleRole(user.id)">{{ authority.name === 'ROLE_ADMIN' ? 'Make User' : 'Make Brewer'}}</button>
                            </div> -->
                        <td class="button=container">
                            <button class="make-brewer" value="Reload Page" v-on:click="setBrewer(user.id)">Make Brewer</button>
                            <button class="make-user" value="Reload Page" v-on:click="setUser(user.id)">Make User</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            </div>
            <div class="table-container">
            <h3> Breweries </h3>
            <form>
                <label>Brewery Id</label>
                <input type='text' v-model="breweryId" />
                <label>Brewer Id</label>
                <input type='text' v-model="brewerId" />
                <button class="update-brewer" v-on:click="changeBrewer()">Update Brewer</button>
            </form> 
            <table id="tblBreweries" class="data-table">
                <thead>
                    <tr>
                        <th>brewery Name</th>
                        <th>brewery Id</th>
                        <th>brewer Id</th>
                        <th>address</th>
                        <th class="actions">actions</th>
                    </tr>
                
                </thead>
                <tbody v-for="brewery in breweriesGetter" v-bind:key="brewery.breweryId" v-bind:brewery = "brewery">
                    <tr>  
                        <td> {{ brewery.breweryName }}</td>
                        <td>{{ brewery.breweryId }}</td>
                        <td>{{ brewery.brewerId }}</td>
                        <td>{{ brewery.address }}</td>
                        <button class="delete-brewery" v-on:click="deleteBrewery(brewery.breweryId)">Delete Brewery</button>
                    </tr>
                </tbody>
            </table>
            </div>
        </main>
    </div>
</div>    
</template>

<script>
import BreweryService from '../services/BreweryService'
import ManagerService from "../services/ManagerService"


export default {
    name:"manager-profile", 
    data() {
        return {
            users: this.$store.state.users,
            breweries: this.$store.state.breweries,
            user: {},
            isEditing: false,
            brewerId: '',
            breweryId: ''
        }
    },
    methods: {
        getUserList() {
            ManagerService
            .getUsers()
            .then((response) => {
                this.$store.commit("SET_USERS", response.data)
            })
            .catch((error) => {
                if (error.response && error.response.status === 404) {
                    alert("Users are not available");
                }
            });
        },
        getBreweriesList() {
            BreweryService
            .getBreweries()
            .then((response) => {
                this.$store.commit("SET_BREWERY_ARRAY", response.data);
            })
            .catch((error) => {
                if (error.response && error.response.status === 404) {
                    alert("Breweries not available");
                }
            });
        }, 
        setBrewer(id) {
            this.singleUser = this.usersGetter.find(user => user.id = id)
            ManagerService
            .updateRole({user:this.singleUser, role:'ROLE_ADMIN'})
            .then((response) => {
                if (response.status == 202) {
                    this.$store.commit('SET_ROLE', this.singleUser)
                }
            })
            .catch ((error) => {
                if (error.response && error.response.status == 404) {
                    alert("unable to change role")
                }
            })
        }, 
         setUser(id) {
            this.singleUser = this.usersGetter.find(user => user.id = id)
            ManagerService
            .updateRole({user:this.singleUser, role:'ROLE_USER'})
            .then((response) => {
                if (response.status == 202) {
                    this.$store.commit('SET_ROLE', this.singleUser)
                }
            })
            .catch ((error) => {
                if (error.response && error.response.status == 404) {
                    alert("unable to change role")
                }
            })
        }, 
        toggleRole(id) {
            const userToUpdate = this.usersGetter.find(user => user.id === id); 
            if (userToUpdate) {
                const newRole = userToUpdate.role === 'ROLE_ADMIN' ? 'ROLE_USER' : 'ROLE_ADMIN'; 
                ManagerService.updateRole({ user: userToUpdate, role: newRole })
                .then(response => {
                    if (response.status === 200) {
                        this.$store.commit('SET_ROLE', userToUpdate); 
                    }
                })
                .catch((error) => {
                    if (error.response && error.response.status === 404) {
                        alert("Unable to change role")
                    }
                })
            }
        }, 
        deleteBrewery(id) {
            ManagerService
            .deleteBrewery(id)
            .then(response => {
                if (response.state == 200) {
                    this.$store.commit('DELETE_BREWERY', id); 
                }
            })
            .catch((error) => {
                if (error.response && error.response.status === 404) {
                    alert("Unable to delete brewery")
                }
            })
        }, 
        changeBrewer() {
            const updatedBrewery = this.$store.state.breweries.find(d => d.breweryId == this.breweryId)
            updatedBrewery.brewerId = this.brewerId
            ManagerService
            .updateBrewer(updatedBrewery)
            .then(response => {
                if (response.state == 200) {
                    this.$store.commit('UPDATE_BREWER', updatedBrewery); 
                }
            })
             .catch((error) => {
                if (error.response && error.response.status === 404) {
                    alert("Unable to change brewer")
                }
            })
        }
    },
    computed: {
        usersGetter() {
            return this.$store.state.users
        }, 
        userGetter() {
            return this.$store.state.singleUser
        }, 
        breweriesGetter() {
            return this.$store.state.breweries
        }, 
        isBrewer() {
             console.log(this.$store.state.singleUser)
             let result = this.$store.state.singleUser.authorities.filter(d => d.name === 'ROLE_ADMIN')
             if (result.length > 0) {
                 return true
             } else {
                 return false
             }
        }
    }, 
    mounted() {
        this.getUserList();
        this.getBreweriesList();
    }
}
</script>

<style scoped>

.manager-profile {
    display: flex;
    flex-direction: column;
    background-color: #f1f1f1;
    color: rgba(17,21,20,255);
}

.header-container {
    background-color: rgba(53,54,49,255);
    color: #f1f1f1;
    width: 100%
}

.main-container {
    display: flex; 
    flex-direction: column;
    
}

.table-container {
    max-width: 300px;
    padding: 20px;
    
}

.data-table th, 
.data-table td {
    padding: 10px;
    border: 1px solid #ccc;
    text-align: left; 
}

.data-table th {
    color: rgba(17,21,20,255);
    text-transform: uppercase; 
    border: 1px; 
    padding: 8px; 
    text-align: center;
}

.title {
    margin-top: 10rem;
    margin-left: 5rem;
}

.data-table td {
    color: rgba(53,54,49,255);
}

.make-brewer {
    color: rgba(17,21,20,255);
    border: 2px solid #353631;
    background-color: rgba(241,79,41,255);
}

.make-user {
    color: rgba(17,21,20,255);
    border: 2px solid #353631;
}

.update-brewer {
    color: rgba(17,21,20,255);
    border: 2px solid #353631;
    background-color: rgba(241,79,41,255);
    border-radius: 5px;
    margin-left: 20px;
}

.delete-user {
    color: rgba(17,21,20,255);
    border: 2px solid #353631;
}



</style>